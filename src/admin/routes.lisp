(uiop:define-package #:40ants-bots/admin/routes
  (:use #:cl)
  (:import-from #:40ants-routes/defroutes
                #:include
                #:defroutes)
  (:import-from #:reblocks/routes
                #:page)
  (:import-from #:40ants-bots/admin/pages/dashboard
                #:make-dashboard-page)
  (:import-from #:40ants-bots/admin/pages/user
                #:make-user-page)
  (:import-from #:40ants-bots/admin/pages/user-messages
                #:make-user-messages-page)
  (:import-from #:40ants-bots/admin/pages/users
                #:make-users-page)
  (:import-from #:serapeum
                #:eval-always)
  (:export #:*routes*))
(in-package #:40ants-bots/admin/routes)


(eval-always
  (defun get-user-name (user-id)
    (let ((user (40ants-bots/controllers/user:get-user-by-id user-id)))
      (cond
        (user
         (40ants-bots/controllers/user:get-username-or-full-name user))
        (t
         "Unknown"))))

  (defun get-user-route-title (&key user-id)
    (cond
      (user-id (get-user-name user-id))
      (t "Unknown User")))


  (defun get-user-messages-route-title (&key user-id)
    (cond
      (user-id (format nil "~A messages" (get-user-name user-id)))
      (t "User"))))


(defroutes (*user-routes* :namespace "user")
  (page ("/<int:user-id>" :name "user"
                          :title #'get-user-route-title)
    (make-user-page user-id))
  (page ("/<int:user-id>/messages" :name "user-messages"
                                   :title #'get-user-messages-route-title)
    (make-user-messages-page user-id)))


(defroutes (*users-routes* :namespace "users")
  (page ("/" :name "users" :title "Users")
    (make-users-page))
  (include *user-routes*))


(defroutes (*routes* :namespace "40ants-bots")
  (page ("/" :name "index" :title "Dashboard")
    (make-dashboard-page))

  (include *users-routes*
           :path "/users/"))
