(uiop:define-package #:40ants-bots/telegram/utils
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
  (:export #:get-text-from-update-if-possible
           #:get-text-from-message-if-possible
           #:get-message-from-update))
(in-package #:40ants-bots/telegram/utils)


(-> get-text-from-update-if-possible (cl-telegram-bot2/api:update)
    (values (or null string)
            &optional))

(defun get-text-from-message-if-possible (message)
  (let* ((text (when message
                 (or (cl-telegram-bot2/api:message-text message)
                     (cl-telegram-bot2/api:message-caption message)))))
    text))

(defun get-text-from-update-if-possible (update)
  (let* ((message (cl-telegram-bot2/api:update-message update)))
    (when message
      (get-text-from-message-if-possible message))))


(defvar *supported-message-types*
  '(cl-telegram-bot2/api:message
    cl-telegram-bot2/api::edited-message
    cl-telegram-bot2/api::channel-post
    cl-telegram-bot2/api::edited-channel-post
    cl-telegram-bot2/api:business-connection
    cl-telegram-bot2/api::business-message
    cl-telegram-bot2/api::edited-business-message
    cl-telegram-bot2/api::deleted-business-messages
    cl-telegram-bot2/api::message-reaction
    cl-telegram-bot2/api::message-reaction-count
    cl-telegram-bot2/api:inline-query
    cl-telegram-bot2/api:chosen-inline-result
    cl-telegram-bot2/api:callback-query
    cl-telegram-bot2/api:shipping-query
    cl-telegram-bot2/api:pre-checkout-query
    cl-telegram-bot2/api::purchased-paid-media
    cl-telegram-bot2/api:poll
    cl-telegram-bot2/api:poll-answer
    cl-telegram-bot2/api::my-chat-member
    cl-telegram-bot2/api:chat-member
    cl-telegram-bot2/api:chat-join-request
    cl-telegram-bot2/api:chat-boost
    cl-telegram-bot2/api::removed-chat-boost))


(defun get-message-from-update (update)
  "Return message, message type and message-id."
  (loop for slot in *supported-message-types*
        when (slot-boundp update slot)
          do (let ((message (slot-value update slot)))
               (return message))))

