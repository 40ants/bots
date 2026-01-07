(uiop:define-package #:40ants-bots/admin/pages/user
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
  (:import-from #:40ants-bots/controllers/chat
                #:get-private-chat)
  (:import-from #:40ants-routes/route-url
                #:route-url)
  (:import-from #:40ants-bots/models/chat
                #:chat-bot-is-blocked-p)
  (:export #:make-user-page))
(in-package #:40ants-bots/admin/pages/user)


(defwidget user-page (ui-widget)
  ((user-id :initarg :user-id
            :type integer
            :reader user-id)))


(defun make-user-page (user-id)
  (make-instance 'user-page
                 :user-id user-id))



(defmethod render ((widget user-page) (theme tailwind-theme))
  (let* ((user (get-user-by-id (user-id widget)))
         (chat (get-private-chat user))
         (is-blocked (when chat
                       (chat-bot-is-blocked-p chat))))
    (cond
      (user
       (multiple-value-bind (latest-message incoming latest-message-date)
           (get-latest-message user)
         (with-html ()
           (:h2 :class "text-4xl"
                (fmt "User ~A"
                     (user-username user)))
           (:table
            (:tr
             (:td "Registered")
             (:td (format-date (object-created-at user))))
            (cond
              (chat
               (when is-blocked
                 (:tr
                  (:td "Chat state")
                  (:td "🚫 Этот пользователь заблокировал бота.")))
               (:tr
                (:td "Num Messages")
                (:td (fmt "~A" (get-num-messages user))))
               (:tr
                (:td "Latest message at")
                (:td (if latest-message-date
                         (format-date latest-message-date)
                         "")))
               (:tr
                (:td "Latest message")
                (:td (:a :href (route-url "user-messages"
                                          :user-id (user-id widget))
                         (if latest-message
                             (concatenate 'string
                                          (if incoming
                                              "⬇ "
                                              "⬆ ")
                                          (str:shorten 50 latest-message))
                             "No messages")))))
              ;; No chat
              (t
               (:tr
                (:td "Chat state")
                (:td "Этот пользователь не начинал чат с ботом."))))))))

      (t
       (reblocks/response:not-found-error (fmt "User with id ~A not found"
                                               (user-id widget)))))))

