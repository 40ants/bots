(uiop:define-package #:40ants-bots/admin/pages/dashboard
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
  (:export #:make-dashboard-page
           #:dashboard))
(in-package #:40ants-bots/admin/pages/dashboard)


(defwidget dashboard (ui-widget)
    ())


(defun make-dashboard-page ()
  (make-instance 'dashboard))



(defmethod render ((widget dashboard) (theme tailwind-theme))
  (with-html ()
    (:h2 :class "text-4xl"
         "Dashboard")
    (render
     (make-latest-users)
     theme)))
