(uiop:define-package #:40ants-bot/pipeline
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/api)
  (:import-from #:cl-telegram-bot2/pipeline)
  (:import-from #:40ants-bots/bot
                #:bot)
  (:import-from #:40ants-bots/vars
                #:*current-user*
                #:*current-chat*)
  (:import-from #:40ant-bots/controller/user
                #:get-or-create-user)
  (:import-from #:40ants-bots/controller/chat
                #:get-or-create-chat)
  (:import-from #:alexandria
                #:make-keyword)
  (:import-from #:40ants-bots/controller/message
                #:create-message)
  (:import-from #:serapeum
                #:->))
(in-package #:40ants-bot/pipeline)


(defvar *updates* nil)

(-> get-text-from-update-if-possible (cl-telegram-bot2/api:update)
    (values (or null string)
            &optional))

(defun get-text-from-update-if-possible (update)
  (let* ((message (cl-telegram-bot2/api:update-message update))
         (text (when message
                 (or (cl-telegram-bot2/api:message-text message)
                     (cl-telegram-bot2/api:message-caption message)))))
    text))


(defmethod cl-telegram-bot2/generics:process :around ((bot bot) (state null) (update cl-telegram-bot2/api:update))
  (40ants-bots/db:with-connection ()
    (let* ((platform :telegram)
           (api-user (cl-telegram-bot2/pipeline::get-user update))
           (user-platform-id (cl-telegram-bot2/api:user-id api-user))
           (username (cl-telegram-bot2/api:user-username api-user))
           (user-as-json (cl-telegram-bot2/spec::unparse api-user))
           (user (get-or-create-user platform
                                     user-platform-id
                                     username
                                     user-as-json))
           (api-chat (cl-telegram-bot2/pipeline::get-chat update))
           (chat-platform-id (cl-telegram-bot2/api:chat-id api-chat))
           (chat-type (make-keyword (string-upcase
                                     (or (cl-telegram-bot2/api::chat-type api-chat)
                                         (error "No chat type")))))
           (chat-as-json (cl-telegram-bot2/spec::unparse api-chat))
           (chat (get-or-create-chat platform
                                     chat-platform-id
                                     :type chat-type
                                     :raw chat-as-json))
           (update-platform-id (cl-telegram-bot2/api:update-update-id update))
           (update-as-json (cl-telegram-bot2/spec::unparse update))
           (message (create-message platform
                                    update-platform-id
                                    chat
                                    user
                                    (or (get-text-from-update-if-possible update)
                                        "No text")
                                    :raw update-as-json))
           (*current-user* user)
           (*current-chat* chat))
      (declare (ignore message))
      
      (push (list state update *current-user*)
            *updates*)
      (call-next-method))))
