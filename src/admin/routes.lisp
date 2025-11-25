(uiop:define-package #:40ants-bots/admin/routes
  (:use #:cl)
  (:import-from #:40ants-routes/defroutes
                #:defroutes)
  (:import-from #:reblocks/routes
                #:page)
  (:import-from #:40ants-bots/admin/pages/dashboard
                #:make-dashboard-page)
  (:import-from #:40ants-bots/admin/pages/user
                #:make-user-page)
  (:export #:*routes*))
(in-package #:40ants-bots/admin/routes)


(defroutes (*routes* :namespace "40ants-bots")
  (page ("/user/<int:user-id>" :name "user" :title "User")
    (make-user-page user-id))
  (page ("/" :name "index" :title "Dashboard")
    (make-dashboard-page)))
