(uiop:define-package #:40ants-bots/pipeline
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/api)
  (:import-from #:cl-telegram-bot2/pipeline)
  (:import-from #:40ants-bots/bot
                #:bot)
  (:import-from #:40ants-bots/vars
                #:*current-bot*
                #:*current-user*
                #:*current-chat*)
  (:import-from #:40ants-bots/controllers/user
                #:get-or-create-user)
  (:import-from #:40ants-bots/controllers/chat
                #:get-or-create-chat)
  (:import-from #:alexandria
                #:make-keyword)
  (:import-from #:40ants-bots/controllers/message
                #:create-message)
  (:import-from #:serapeum
                #:->)
  (:import-from #:cl-telegram-bot2/high
                #:collect-sent-messages)
  (:import-from #:cl-telegram-bot2/generics
                #:process-update)
  (:import-from #:cl-telegram-bot2/vars
                #:*default-special-bindings*)
  (:import-from #:cl-telegram-bot2/states/base
                #:var)
  (:import-from #:40ants-bots/telegram/utils
                #:get-message-from-update
                #:get-text-from-message-if-possible)
  (:import-from #:40ants-bots/controllers/dwh
                #:maybe-save-update-to-dwh))
(in-package #:40ants-bots/pipeline)



(defmethod process-update :around ((bot bot) (update cl-telegram-bot2/api:update))
  (let ((platform :telegram))
    (flet ((get-chat-from (update-or-message)
             (let* ((api-chat (cl-telegram-bot2/pipeline::get-chat update-or-message))
                    (chat-platform-id (cl-telegram-bot2/api:chat-id api-chat))
                    (chat-type (make-keyword (string-upcase
                                              (or (cl-telegram-bot2/api::chat-type api-chat)
                                                  (error "No chat type")))))
                    (chat-as-json (cl-telegram-bot2/spec::unparse api-chat)))
               (get-or-create-chat platform
                                   chat-platform-id
                                   :type chat-type
                                   :raw chat-as-json))))
      (let* (;; Не все типы message могут быть привязаны к автору.
             ;; У тех что отправлены в канал, from не заполнено.
             (api-user (cl-telegram-bot2/pipeline::get-user update))
             (user-platform-id (when api-user
                                 (cl-telegram-bot2/api:user-id api-user)))
             (username (when api-user
                         (cl-telegram-bot2/api:user-username api-user)))
             (user-as-json (when api-user
                             (cl-telegram-bot2/spec::unparse api-user)))
             (user (when api-user
                     (get-or-create-user platform
                                         user-platform-id
                                         username
                                         user-as-json)))
             (chat (get-chat-from update))
             (*current-user* user)
             (*current-chat* chat)
             (*current-bot* bot)
             (*default-special-bindings*
               (list*
                '(*current-user* . *current-user*)
                '(*current-chat* . *current-chat*)
                '(*current-bot* . *current-bot*)
                *default-special-bindings*)))
    
        (flet ((save-message (message &key incomingp)
                 (let* ((message-platform-id (cl-telegram-bot2/api:message-message-id message))
                        (message-as-json (cl-telegram-bot2/spec::unparse message))
                        (chat (cond
                                (incomingp
                                 chat)
                                (t
                                 ;; Here we can't rely on the chat object from the outer environment,
                                 ;; becase the message can be a message sent by the bot to other chat or user
                                 (get-chat-from message))))
                        (user (cond
                                (incomingp
                                 user)
                                ;; Outgoing messages we are not binding to a user, because they are
                                ;; from the bot for which we have no a record in the bots.users table:
                                (t
                                 nil)))
                        (message (create-message platform
                                                 message-platform-id
                                                 chat
                                                 user
                                                 (or (get-text-from-message-if-possible message)
                                                     "No text")
                                                 :incomingp incomingp
                                                 :raw message-as-json))
                        (message-id (mito:object-id message)))
                   (when incomingp
                     (setf (var "40bots:last-incoming-message-id")
                           message-id))
                   (values))))

          (let ((payload (get-message-from-update update)))
            (cond
              ((typep payload 'cl-telegram-bot2/api:message)
               (save-message payload
                             :incomingp t))
              (t
               (maybe-save-update-to-dwh update))))
        
          (multiple-value-bind (sent-messages result)
              (collect-sent-messages
                (call-next-method))

            (loop for message in sent-messages
                  do (log:info "Sent message" message)
                     (save-message message
                                   :incomingp nil))
            (values result)))))))
