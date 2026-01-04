(uiop:define-package #:40ants-bots/controllers/delayed-trigger
  (:use #:cl)
  (:import-from #:log)
  (:import-from #:40ants-bots/models/delayed-trigger
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
                #:retrieve-by-sql)
  (:import-from #:sxql
                #:where
                #:order-by
                #:<=)
  (:import-from #:local-time
                #:now)
  (:import-from #:40ants-pg/transactions
                #:with-transaction)
  (:import-from #:alexandria
                #:make-keyword)
  (:import-from #:log4cl-extras/error
                #:with-log-unhandled)
  (:export #:get-next-delayed-trigger
           #:with-next-trigger
           #:reschedule
           #:process-pending-triggers))
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
   AND processed_at IS NULL
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


;; (defun call-with-next-trigger (callback)
;;   "Main function that handles the trigger processing logic."
;;   (let ((trigger-obj (get-next-delayed-trigger)))
;;     (when trigger-obj
;;       (handler-case 
;;           (let ((results-hash (make-hash-table :test 'equal)))
;;             (funcall callback trigger-obj results-hash)
;;             ;; If we reach here, update processed-at and results
;;             (setf (delayed-trigger-processed-at trigger-obj) (local-time:now)
;;                   (delayed-trigger-results trigger-obj) results-hash)
;;             (mito:update-dao trigger-obj))
;;         (reschedule-condition (condition-var)
;;           ;; If reschedule was called, update check-at instead
;;           (setf (delayed-trigger-check-at trigger-obj) 
;;                 (new-check-at condition-var))
;;           (mito:update-dao trigger-obj))))))


;; (defmacro with-next-trigger ((trigger-var &key (results-hash 'results-hash)) &body body)
;;   "A macro that selects the next trigger, executes the body, and updates the trigger's
;;    processed-at and results (or reschedules it if reschedule is called).
   
;;    Within the body, you can use the results-hash variable to store results."
;;   `(call-with-next-trigger 
;;      (lambda (,trigger-var ,results-hash)
;;        ,@body)))


(defun process-pending-triggers ()
  "Process all pending triggers in a loop, executing their callback functions."
  (loop
    ;; Start a new transaction for this trigger
    (with-log-unhandled ()
      (with-transaction ()
        (let ((trigger (get-next-delayed-trigger)))
          (unless trigger
            ;; No more triggers to process
            (return))
         
          (let* ((callback-symbol-name (delayed-trigger-callback trigger))
                 (callback-symbol (read-from-string callback-symbol-name)))
            (cond
              ((not (fboundp callback-symbol))
               (log:error "Callback function ~A is not bound for trigger ~A (id=~A)" 
                          callback-symbol-name 
                          (delayed-trigger-name trigger)
                          (mito:object-id trigger)))
              (t
               (let ((chat (delayed-trigger-chat trigger))
                     (extra-args (delayed-trigger-extra-arguments trigger)))

                 (handler-case
                     (let ((results (apply callback-symbol
                                           chat
                                           (loop for key being the hash-keys of extra-args
                                                   using (hash-value value)
                                                 append (list (make-keyword key) :keyword
                                                              value)))))
                       (setf (delayed-trigger-processed-at trigger)
                             (local-time:now))
                       (setf (delayed-trigger-results trigger)
                             results))
                   (reschedule-condition (condition)
                     ;; If reschedule was called, update check-at instead
                     (setf (delayed-trigger-check-at trigger)
                           (new-check-at condition))))
                
                 (mito:update-dao trigger))))))))))
