(uiop:define-package #:40ants-bots/admin/pages/user-messages
  (:use #:cl)
  (:import-from #:reblocks/widget
                #:defwidget)
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
                #:fmt)
  (:import-from #:40ants-bots/models/user
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
  (:import-from #:40ants-bots/admin/widgets/send-message-form
                #:send-message-form)
  (:import-from #:40ants-bots/controllers/chat
                #:get-private-chat)
  (:import-from #:reblocks-ui2/themes/styling
                #:css-classes)
  (:import-from #:40ants-bots/controllers/message
                #:get-chat-messages)
  (:export #:make-user-messages-page))
(in-package #:40ants-bots/admin/pages/user-messages)


(defwidget user-messages-page (ui-widget)
  ((user-id :initarg :user-id
            :type integer
            :reader user-id)))


(defun make-user-messages-page (user-id)
  (make-instance 'user-messages-page
                 :user-id user-id))


(defwidget message-widget (ui-widget)
  ((message :initarg :message
            :reader message)))


(defun make-message-widget (message)
  (make-instance 'message-widget
                 :message message))


(defun get-message-text (message)
  (let* ((raw (message-raw message)))
    (or (gethash "text" raw)
        (gethash "caption" raw)
        (fmt "No \"text\" or \"caption\" in raw message data."))))


(defmethod render ((widget message-widget) (theme tailwind-theme))
  (let* ((message (message widget)))
    (card
     (html ((:div (if (message-incoming message)
                      (fmt "⬇ ~A" (format-date (object-created-at message)))
                      (fmt "⬆ ~A" (format-date (object-created-at message)))))
             (:div
              (:pre (get-message-text (message widget)))))
           :css-classes "w-full")
     ;; :vertical-align :top
     ;; :height '(40)
     )))


(defmethod render ((widget user-messages-page) (theme tailwind-theme))
  (let* ((user (get-user-by-id (user-id widget)))
         (private-chat (get-private-chat user))
         (messages (when private-chat
                     (get-chat-messages private-chat))))
    (with-html ()
      (:div :class "flex flex-col gap-8"
            (cond
              (private-chat
               (:div :class "flex flex-col gap-4"
                     (loop for message in (reverse messages)
                           do (render (make-message-widget message)
                                      theme)))
               (:div :class "flex flex-col gap-4"
                     (render (card
                              (send-message-form user private-chat))
                             theme)))
              (t
               (:p "Этот пользователь пока не писал боту.")))))))

