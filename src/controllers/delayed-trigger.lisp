(uiop:define-package #:40ants-bots/controllers/delayed-trigger
  (:use #:cl)
  (:import-from #:log)
  (:import-from #:40ants-bots/models/delayed-trigger
                #:delayed-trigger-failed-at
                #:delayed-trigger-attempt-number
                #:delayed-trigger
                #:delayed-trigger-processed-at
                #:delayed-trigger-results
                #:delayed-trigger-check-at
                #:delayed-trigger-id
                #:delayed-trigger-callback
                #:delayed-trigger-extra-arguments
                #:delayed-trigger-chat
                #:delayed-trigger-name)
  (:import-from #:mito
                #:select-dao
                #:update-dao
                #:object-id
                #:retrieve-by-sql
                #:create-dao)
  (:import-from #:sxql
                #:where
                #:order-by
                #:<=)
  (:import-from #:local-time
                #:adjust-timestamp!
                #:timestamp
                #:now)
  (:import-from #:40ants-pg/transactions
                #:with-transaction)
  (:import-from #:alexandria
                #:make-keyword)
  (:import-from #:log4cl-extras/error
                #:with-log-unhandled)
  (:import-from #:serapeum
                #:soft-list-of
                #:->)
  (:import-from #:serapeum
                #:dict)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:log4cl-extras/context
                #:with-fields)
  (:import-from #:40ants-bots/vars
                #:*seconds-between-trigger-attempts*
                #:*max-trigger-attemps*)
  (:import-from #:40ants-pg/connection
                #:with-connection)
  (:export #:reschedule
           #:process-pending-triggers
           #:create-delayed-trigger
           #:cancel-triggers))
(in-package #:40ants-bots/controllers/delayed-trigger)


(defun get-next-delayed-trigger ()
  "Selects the next delayed trigger for processing where check-at is less than now().
   Uses SELECT FOR UPDATE to prevent race conditions."
  (first 
   (mito:select-by-sql 'delayed-trigger
                       "
SELECT *
  FROM bots.delayed_triggers
 WHERE check_at <= NOW()
   AND processed_at IS NULL AND failed_at IS NULL AND cancelled_at IS NULL
 ORDER BY check_at ASC
 LIMIT 1
   FOR UPDATE SKIP LOCKED")))


;; Define a condition for rescheduling
(define-condition reschedule-condition ()
  ((new-check-at :initarg :new-check-at
                 :reader new-check-at)))


(defun reschedule (new-check-at)
  "Function to reschedule a trigger to a new time - this function signals a condition
   that will be handled by the WITH-NEXT-TRIGGER macro."
  (signal 'reschedule-condition :new-check-at new-check-at))


(-> process-pending-trigger (delayed-trigger)
    (values &optional))

(defun process-pending-trigger (trigger)
  (let* ((callback-symbol-name (delayed-trigger-callback trigger))
         (callback-symbol (read-from-string callback-symbol-name)))
    (cond
      ((not (fboundp callback-symbol))
       (log:error "Callback function ~A is not bound for trigger ~A (id=~A)" 
                  callback-symbol-name 
                  (delayed-trigger-name trigger)
                  (object-id trigger)))
      (t
       (let ((chat (delayed-trigger-chat trigger))
             (extra-args (delayed-trigger-extra-arguments trigger)))

         (handler-case
             (let ((results (apply (symbol-function callback-symbol)
                                   chat
                                   (loop for key being the hash-keys of extra-args
                                           using (hash-value value)
                                         append (list (make-keyword (string key))
                                                      value)))))
               (setf (delayed-trigger-processed-at trigger)
                     (local-time:now))
               (setf (delayed-trigger-results trigger)
                     results))
           (reschedule-condition (condition)
             ;; If reschedule was called, update check-at instead
             (setf (delayed-trigger-check-at trigger)
                   (new-check-at condition))))
         
         (mito:update-dao trigger)))))
  (values))


(-> fail-pending-trigger (delayed-trigger)
    (values &optional))

(defun fail-pending-trigger (trigger)
  (cond
    ((>= (delayed-trigger-attempt-number trigger)
         *max-trigger-attemps*)
     (log:warn "No more attempts for the trigger.")
     (setf (delayed-trigger-failed-at trigger)
           (now)))
    (t
     (log:warn "No more attempts for the trigger.")
     (setf (delayed-trigger-check-at trigger)
           (adjust-timestamp! (now)
             (offset :sec *seconds-between-trigger-attempts*)))
     (incf (delayed-trigger-attempt-number trigger))))
  (mito:save-dao trigger)
  (values))


(defun process-pending-triggers ()
  "Process all pending triggers in a loop, executing their callback functions."
  (loop with trigger = nil
        do ;; Start a new transaction for each trigger
           (handler-case
               (with-log-unhandled ()
                 (with-transaction ()
                   (setf trigger (get-next-delayed-trigger))
                   (unless trigger
                     ;; No more triggers to process
                     (return))
                   (with-fields (:trigger-id (object-id trigger))
                     (process-pending-trigger trigger))))
             (serious-condition ()
               (when trigger
                 ;; Updating in a separate connection
                 (with-log-unhandled ()
                   (with-connection (:cached nil)
                     (with-fields (:trigger-id (object-id trigger))
                       (fail-pending-trigger trigger)))))))))


(-> symbol-full-name (symbol)
    (values string &optional))

(defun symbol-full-name (symbol)
  "Returns the full string representation of a symbol including package name."
  (format nil "~A::~A"
          (package-name (symbol-package symbol))
          (symbol-name symbol)))


(-> create-delayed-trigger (chat string symbol timestamp &rest t)
    (values delayed-trigger &optional))

(defun create-delayed-trigger (chat name callback-symbol timestamp &rest rest)
  "Creates a new delayed trigger with the given parameters.
   chat: The chat object to associate with the trigger
   name: A string name for the trigger
   callback-symbol: A symbol of the function to call
   timestamp: The time when the trigger should be processed
   rest: keyword arguments to pass into a callback."
  (with-transaction ()
    (let ((callback-symbol-name (symbol-full-name callback-symbol))
          (extra-args (loop with result = (dict)
                            for (key value) on rest by #'cddr
                            do (setf (gethash (symbol-name key) result)
                                     value)
                            finally (return result))))
      ;; Check for existing active trigger with same name for this chat
      ;; Use SELECT FOR UPDATE to prevent race conditions
      (let ((existing-trigger (first 
                               (mito:select-by-sql 'delayed-trigger
                                                   "SELECT * 
                                                    FROM bots.delayed_triggers
                                                    WHERE chat_id = ?
                                                      AND name = ?
                                                      AND processed_at IS NULL 
                                                      AND failed_at IS NULL 
                                                      AND cancelled_at IS NULL
                                                    LIMIT 1
                                                    FOR UPDATE"
                                                   :binds (list (mito:object-id chat) name)))))
        (cond
          (existing-trigger
           ;; Update existing trigger
           (setf (delayed-trigger-callback existing-trigger) callback-symbol-name
                 (delayed-trigger-check-at existing-trigger) timestamp
                 (delayed-trigger-extra-arguments existing-trigger) extra-args)
           (mito:update-dao existing-trigger)
           (values existing-trigger))
          (t
           ;; Create new trigger
           (let ((new-trigger
                   (create-dao 'delayed-trigger
                               :chat chat
                               :name name
                               :callback callback-symbol-name
                               :check-at timestamp
                               :extra-arguments extra-args)))
             (values new-trigger))))))))


(-> cancel-triggers (chat string)
    (values (soft-list-of delayed-trigger) &optional))

(defun cancel-triggers (chat name-prefix)
  "Cancels all pending triggers whose names start with the given prefix.
   
   Specifically, finds and cancels all delayed triggers where:

   - The name starts with the given NAME-PREFIX
   - processed-at is NULL (not yet processed successfully)
   - cancelled-at is NULL (not already cancelled)
   
   Sets the cancelled-at field of matching triggers to the current timestamp
   and returns the number of triggers that were cancelled."
  (values
   (mito:select-by-sql 'delayed-trigger
                       "UPDATE bots.delayed_triggers 
                        SET cancelled_at = NOW()
                        WHERE chat_id = ?
                          AND name LIKE ?
                          AND processed_at IS NULL
                          AND failed_at IS NULL
                          AND cancelled_at IS NULL
                        RETURNING *"
                       :binds (list
                               (mito:object-id chat)
                               (format nil "~A%" name-prefix)))))
