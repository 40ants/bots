(uiop:define-package #:40ants-bots/api
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/high
                #:*collected-messages*
                #:defun-with-same-keys)
  (:import-from #:serapeum
                #:->)
  (:import-from #:cl-telegram-bot2/errors
                #:error-description
                #:telegram-error)
  (:import-from #:40ants-bots/controllers/chat
                #:get-private-chat)
  (:import-from #:40ants-bots/models/chat
                #:chat-platform-id)
  (:export
   #:send-message))
(in-package #:40ants-bots/api)


(-> %get-chat-id-from ((or 40ants-bots/models/chat:chat
                        40ants-bots/models/user:user))
    (values integer &optional))

(defun %get-chat-id-from (chat-or-user)
  (etypecase chat-or-user
    (40ants-bots/models/chat:chat
     (chat-platform-id chat-or-user))
    (40ants-bots/models/user:user
     (%get-chat-id-from (get-private-chat chat-or-user)))))


(defun-with-same-keys (send-message cl-telegram-bot2/api:send-message)
                      (chat-or-user text &rest rest)
  (let* ((chat-id (%get-chat-id-from chat-or-user))
         (message (handler-case
                      (apply #'cl-telegram-bot2/api:send-message
                             chat-id
                             text
                             rest)
                    (telegram-error (err)
                      (when (string= (error-description err)
                                     "Bad Request: need administrator rights in the channel chat")
                        (log:warn "Unable to reply to chat ~S because bot needs administration rights on this channel"
                                  chat-id)
                        (return-from send-message nil))))))
    (when (boundp '*collected-messages*)
      (push message *collected-messages*))
    (values message)))
