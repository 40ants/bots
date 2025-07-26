(uiop:define-package #:40ants-bots/db
  (:use #:cl)
  (:import-from #:dbi
                #:connect-cached)
  (:export #:connect-in-repl
           #:with-connection))
(in-package #:40ants-bots/db)


(defun get-connection-args ()
  (let* ((db-name (or (uiop:getenv "POSTGRES_DBNAME")
                      (error "POSTGRES_DBNAME env var is empty")))
         (db-user (or (uiop:getenv "POSTGRES_USER")
                      (error "POSTGRES_USER env var is empty")))
         (db-pass (or (uiop:getenv "POSTGRES_PASSWORD")
                      (error "POSTGRES_PASSWORD env var is empty")))
         (db-host (or (uiop:getenv "POSTGRES_HOST")
                      (error "POSTGRES_HOST env var is empty")))
         (db-port (parse-integer
                   (or (uiop:getenv "POSTGRES_PORT")
                       (error "POSTGRES_PORT env var is empty")))))
    (list :postgres :database-name db-name
                    :username db-user
                    :password db-pass
                    :host db-host
                    :port db-port)))


(defun call-with-connection (thunk)
  (let ((mito:*connection* (apply #'connect-cached
                                  (get-connection-args))))
    (unwind-protect
         (funcall thunk)
      (dbi:disconnect mito:*connection*))))


(defun connect-in-repl ()
  (apply #'mito:connect-toplevel
         (get-connection-args)))


(defmacro with-connection (() &body body)
  `(flet ((with-connection-func ()
            ,@body))
     (declare (dynamic-extent #'with-connection-func))
     (call-with-connection #'with-connection-func)))
