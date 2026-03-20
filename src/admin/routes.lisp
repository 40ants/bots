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
  (:import-from #:40ants-bots/admin/pages/user-messages
                #:make-user-messages-page)
  (:export #:*routes*))
(in-package #:40ants-bots/admin/routes)


(defun get-user-name (user-id)
  (let ((user (40ants-bots/controllers/user:get-user-by-id user-id)))
    (cond
      (user
       (40ants-bots/controllers/user:get-username-or-full-name user))
      (t
       "Unknown"))))

(defun get-user-route-title (&key user-id)
  (cond
    (user-id (format nil "User ~A" (get-user-name user-id)))
    (t "User")))


(defun get-user-messages-route-title (&key user-id)
  (cond
    (user-id (format nil "~A messages" (get-user-name user-id)))
    (t "User")))


(defroutes (*routes* :namespace "40ants-bots")
  (page ("/" :name "index" :title "Dashboard")
    (make-dashboard-page))
  (page ("/user/<int:user-id>" :name "user"
                               :title #'get-user-route-title)
    (make-user-page user-id))
  (page ("/user/<int:user-id>/messages" :name "user-messages"
                                        :title #'get-user-messages-route-title)
    (make-user-messages-page user-id)))
