(uiop:define-package #:40ant-bots/controller/user
  (:use #:cl)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:mito
                #:create-dao
                #:find-dao)
  (:import-from #:40ants-bots/vars
                #:*current-user*)
  (:export #:get-user
           #:create-user
           #:get-or-create-user
           #:get-current-user))
(in-package #:40ant-bots/controller/user)


(defun get-current-user ()
  (unless (boundp '*current-user*)
    (error "GET-CURRENT-USER can be used only during request processing."))
  *current-user*)


(defun get-user (platform platform-id)
  (find-dao 'user
            :platform platform
            :platform-id platform-id))


(defun create-user (platform platform-id username raw)
  (create-dao 'user
              :platform platform
              :platform-id platform-id
              :username username
              :raw raw))


(defun get-or-create-user (platform platform-id username raw)
  (or (get-user platform platform-id)
      (create-user platform platform-id username raw)))
