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
                #:var))
(in-package #:40ants-bots/pipeline)


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


(defmethod process-update :around ((bot bot) (update cl-telegram-bot2/api:update))
  (let* ((platform :telegram)
         ;; Не все типы message могут быть привязаны к автору.
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
         ;; (update-platform-id (cl-telegram-bot2/api:update-update-id update))
         ;; (update-as-json (cl-telegram-bot2/spec::unparse update))
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
                    (message (create-message platform
                                             message-platform-id
                                             chat
                                             user
                                             (or (get-text-from-message-if-possible message)
                                                 "No text")
                                             :incomingp incomingp
                                             :raw message-as-json))
                    (message-id (mito:object-id message)))
               (setf (var "40bots:last-incoming-message-id")
                     message-id)
               (values))))

      (let ((payload (get-message-from-update update)))
        (when (typep payload 'cl-telegram-bot2/api:message)
          (save-message payload
                        :incomingp t)))
        
      (multiple-value-bind (sent-messages result)
          (collect-sent-messages
            (call-next-method))

        (loop for message in sent-messages
              do (log:info "Sent message" message)
                 (save-message message
                               :incomingp nil))
        (values result)))))
