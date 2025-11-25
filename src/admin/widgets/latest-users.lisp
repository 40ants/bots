(uiop:define-package #:40ants-bots/admin/widgets/latest-users
  (:use #:cl)
  (:import-from #:reblocks/widget
                #:defwidget)
  (:import-from #:reblocks-ui2/widget
                #:render
                #:ui-widget)
  (:import-from #:reblocks-ui2/themes/tailwind
                #:tailwind-theme)
  (:import-from #:reblocks/html
                #:with-html)
  (:import-from #:40ants-bots/controllers/user
                #:get-latest-users)
  (:import-from #:reblocks-ui2/tables/table
                #:column
                #:make-table)
  (:import-from #:40ants-bots/models/user
                #:user-username)
  (:import-from #:mito
                #:object-id
                #:object-created-at)
  (:import-from #:40ants-bots/utils
                #:format-date)
  (:import-from #:alexandria
                #:compose)
  (:import-from #:reblocks-ui2/html
                #:html)
  (:import-from #:serapeum
                #:fmt)
  (:import-from #:40ants-routes/route-url
                #:route-url)
  (:export #:make-latest-users))
(in-package #:40ants-bots/admin/widgets/latest-users)


(defwidget latest-users (ui-widget)
    ())


(defun make-latest-users ()
  (make-instance 'latest-users))



(defmethod render ((widget latest-users) (theme tailwind-theme))
  (with-html ()
    (:h2 :class "text-2xl"
         "Latest Users")
    (let* ((users (get-latest-users))
           (table
             (make-table
              (list (column "Username"
                            :getter #'identity
                            :cell-maker (lambda (user)
                                          (html ((:a :href (route-url "user"
                                                                      :user-id (object-id user))
                                                     (user-username user))))
                                          ))
                    (column "Created At"
                            :getter #'object-created-at
                            :cell-maker (compose #'reblocks/widgets/string-widget:make-string-widget
                                                 #'format-date)))
              users)))
      (render table theme))))
