(uiop:define-package #:40ants-bots/admin/widgets/send-message-form
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/api)
  (:import-from #:reblocks/widget
                #:update
                #:defwidget)
  (:import-from #:40ants-bots/controllers/message
                #:create-message)
  (:import-from #:reblocks-ui2/widget
                #:render
                #:ui-widget)
  (:import-from #:reblocks-ui2/themes/tailwind
                #:tailwind-theme)
  (:import-from #:40ants-bots/admin/widgets/latest-users
                #:make-latest-users)
  (:import-from #:reblocks/html
                #:with-html)
  (:import-from #:40ants-bots/controllers/user
                #:get-user-messages
                #:get-latest-message
                #:get-num-messages
                #:get-user-by-id)
  (:import-from #:serapeum
                #:->
                #:fmt)
  (:import-from #:40ants-bots/models/user
                #:user
                #:user-username)
  (:import-from #:40ants-bots/utils
                #:format-date)
  (:import-from #:mito
                #:object-created-at)
  (:import-from #:reblocks-ui2/card
                #:card)
  (:import-from #:reblocks-ui2/html
                #:html)
  (:import-from #:40ants-bots/models/message
                #:message-raw
                #:message-incoming)
  (:import-from #:reblocks-ui2/inputs/textarea
                #:textarea)
  (:import-from #:reblocks-ui2/form
                #:form)
  (:import-from #:reblocks-ui2/buttons/button
                #:button)
  (:import-from #:reblocks-ui2/containers/column
                #:column)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:cl-telegram-bot2/api)
  (:import-from #:cl-telegram-bot2/spec
                #:*token*)
  (:import-from #:cl-telegram-bot2/high
                #:collect-sent-messages)
  (:import-from #:40ants-bots/pipeline
                #:get-text-from-message-if-possible)
  (:import-from #:40ants-bots/api
                #:send-message)
  (:export
   #:send-message-form))
(in-package #:40ants-bots/admin/widgets/send-message-form)


(defwidget send-message-form (ui-widget)
  ((chat :initarg :chat
         :type chat
         :reader chat)
   (user :initarg :user
         :type user
         :reader user)))


(-> send-message-form (user chat)
    (values send-message-form &optional))

(defun send-message-form (user chat)
  (make-instance 'send-message-form
                 :user user
                 :chat chat))


(defun call-while-saving-messages (widget func)
  (multiple-value-bind (sent-messages result)
      (collect-sent-messages
        (funcall func))

    (let* ((chat (chat widget))
           (user (user widget))
           (platform (40ants-bots/models/chat:chat-platform chat)))
      (flet ((save-message (message)
               (let* ((message-platform-id (cl-telegram-bot2/api:message-message-id message))
                      (message-as-json (cl-telegram-bot2/spec::unparse message)))
                 (create-message platform
                                 message-platform-id
                                 chat
                                 user
                                 (or (get-text-from-message-if-possible message)
                                     "No text")
                                 :incomingp nil
                                 :raw message-as-json)
                 
                 (values))))
        (loop for message in sent-messages
              do (log:info "Sent message" message)
                 (save-message message))))
    (values result)))


(defmethod render ((widget send-message-form) (theme tailwind-theme))
  (flet ((on-submit (form &key text)
           (declare (ignore form))

           (call-while-saving-messages widget
                                       (lambda ()
                                         (send-message (user widget) text)))

           (update widget)
           (values)))
    (form
     (column
      (html ((:h2 :class "text-2xl"
                  "Ответить")))
      (textarea :name "text")
      (button "Отправить"
              :view :action))
     :on-submit #'on-submit)))

