(uiop:define-package #:40ants-bots/vars
  (:use #:cl)
  (:import-from #:serapeum
                #:defvar-unbound)
  (:export
   #:*seconds-between-trigger-attempts*
   #:*max-trigger-attemps*))
(in-package #:40ants-bots/vars)


(defvar-unbound *current-user*
  "Will be bound to a current user model instance of type 40ANTS-BOTS/MODELS/USER:USER during request processing.")

(defvar-unbound *current-chat*
  "Содержит текущий активный чат, с которым работает бот.")

(defvar-unbound *current-bot*
  "Содержит текущего бота, который обрабатывает сообщение.")

(defvar-unbound *current-db-message*
  "Contains a NIL or object of type 40ANTS-BOTS/MODELS/MESSAGE:MESSAGE, created while processing a current update.")


(defvar *max-trigger-attemps* 5
  "Number of attempts to process a trigger.")


(defparameter *seconds-between-trigger-attempts* (* 1 60)
  "Number of attempts to process a trigger.")
