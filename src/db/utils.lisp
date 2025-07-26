(uiop:define-package #:40ants-bots/db/utils
  (:use #:cl)
  (:import-from #:serapeum
                #:->)
  (:import-from #:alexandria
                #:make-keyword)
  (:export #:keyword-to-db
           #:keyword-from-db
           #:hash-to-db
           #:hash-from-db))
(in-package #:40ants-bots/db/utils)


(-> keyword-to-db (keyword)
    (values string &optional))

(defun keyword-to-db (value)
  (string-downcase value))


(-> keyword-from-db (string)
    (values keyword &optional))

(defun keyword-from-db (value)
  (make-keyword (string-upcase value)))


(-> hash-to-db (hash-table)
    (values string &optional))

(defun hash-to-db (value)
  (yason:with-output-to-string* ()
    (yason:encode value)))


(-> hash-from-db (string)
    (values hash-table &optional))

(defun hash-from-db (value)
  (yason:parse value))
