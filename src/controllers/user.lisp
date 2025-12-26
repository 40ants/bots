(uiop:define-package #:40ants-bots/controllers/user
  (:use #:cl)
  (:import-from #:40ants-bots/models/user
                #:user-platform
                #:user-platform-id
                #:user-username
                #:user)
  (:import-from #:mito
                #:object-id
                #:retrieve-by-sql
                #:select-dao
                #:create-dao
                #:find-dao)
  (:import-from #:40ants-bots/vars
                #:*current-user*)
  (:import-from #:sxql
                #:where
                #:order-by
                #:limit)
  (:import-from #:local-time
                #:universal-to-timestamp)
  (:import-from #:40ants-bots/models/message
                #:message)
  (:import-from #:serapeum
                #:->)
  (:export #:get-user
           #:create-user
           #:get-or-create-user
           #:get-current-user
           #:get-num-messages
           #:get-latest-message
           #:get-user-messages
           #:get-user-from))
(in-package #:40ants-bots/controllers/user)


(defmethod print-object ((obj user) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~A ~A"
            (user-platform obj)
            (or (user-username obj)
                (user-platform-id obj)))))


(defun get-current-user ()
  (unless (boundp '*current-user*)
    (error "GET-CURRENT-USER can be used only during request processing."))
  *current-user*)


(defun get-user (platform platform-id)
  (find-dao 'user
            :platform platform
            :platform-id platform-id))


(defun get-user-by-id (user-id)
  (find-dao 'user
            :id user-id))


(defun create-user (platform platform-id username raw)
  (create-dao 'user
              :platform platform
              :platform-id platform-id
              ;; Telegram users created by phone number
              ;; do not have a username.
              :username (or username
                            "")
              :raw raw))


(defun get-or-create-user (platform platform-id username raw)
  (or (get-user platform platform-id)
      (create-user platform platform-id username raw)))


(defun get-latest-users (&key (limit 10))
  (select-dao 'user
    (order-by (:desc :created-at))
    (limit limit)))


(defun get-num-messages (user)
  (getf
   (first
    (retrieve-by-sql "select count(*) as count from bots.messages where user_id = ?"
                     :binds (list (object-id user))))
   :count))


(defun get-latest-message (user)
  (let* ((data (retrieve-by-sql "select platform, raw, incoming, created_at from bots.messages where user_id = ? order by created_at desc limit 1"
                                :binds (list (object-id user))))
         (row (first data)))
    (when row
      (let* ((raw (getf row :raw))
             (json (yason:parse raw))
             (platform (getf row :platform))
             (incoming (getf row :incoming))
             (created-at (getf row :created-at)))
        
        (unless (string-equal platform "telegram")
          (error "Platform ~S is not supported"
                 platform))

        (values (or (gethash "caption" json)
                    (gethash "text" json)
                    "No \"caption\" or \"text\" attribute in raw.")
                incoming
                (universal-to-timestamp created-at))))))



(defun get-user-messages (user-id &key (limit 10))
  "Returns messages sent by user to any chats.

   Previously used in admin interface, but was replaced with a function get-chat-messages
   to extract all messages (not only from the user), sent to the chat of the bot with user."
  (mito:select-dao 'message
    (where (:= :user_id user-id))
    (order-by (:desc :created_at))
    (limit limit)))


(defgeneric get-user-from (platform obj)
  (:method ((platform (eql :telegram)) (update cl-telegram-bot2/api:update))
    (get-user-from platform (cl-telegram-bot2/api:update-message update)))
  
  (:method ((platform (eql :telegram)) (message cl-telegram-bot2/api:message))
    (let* (;; Не все типы message могут быть привязаны к автору.
           ;; У тех что отправлены в канал, from не заполнено.
           (api-user (cl-telegram-bot2/pipeline::get-user message))
           (user-platform-id (when api-user
                               (cl-telegram-bot2/api:user-id api-user)))
           (username (when api-user
                       (cl-telegram-bot2/api:user-username api-user)))
           (user-as-json (when api-user
                           (cl-telegram-bot2/spec::unparse api-user))))
    
      (when api-user
        (get-or-create-user :telegram
                            user-platform-id
                            username
                            user-as-json)))))

