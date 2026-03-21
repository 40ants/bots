(uiop:define-package #:40ants-bots/admin/pages/users
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
  (:import-from #:40ants-bots/admin/widgets/latest-users
                #:make-latest-users)
  (:export #:make-users-page))
(in-package #:40ants-bots/admin/pages/users)


(defwidget users-page (ui-widget)
    ())


(defun make-users-page ()
  (make-instance 'users-page))


(defmethod render ((widget users-page) (theme tailwind-theme))
  (with-html ()
    (:h2 :class "text-4xl"
         "Users")
    (:div :class "flex flex-col gap-4"
          (let ((users-table-widget (make-latest-users :limit 1000)))
            (render users-table-widget
                     theme)))))
