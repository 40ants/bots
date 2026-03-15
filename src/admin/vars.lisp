(uiop:define-package #:40ants-bots/admin/vars
  (:use #:cl)
  (:export #:*site-admins*
           #:*default-title*))
(in-package #:40ants-bots/admin/vars)


(defvar *site-admins*
  nil
  "A list of telegram nicknames who can use admin interface.")


(defvar *default-title* "40Ants Bots Admin"
  "A title for admin pages.")


