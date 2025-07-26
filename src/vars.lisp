(uiop:define-package #:40ants-bots/vars
  (:use #:cl)
  (:import-from #:serapeum
                #:defvar-unbound))
(in-package #:40ants-bots/vars)


(defvar-unbound *current-user*
  "Will be bound to a current user model instance of type 40ANTS-BOTS/MODELS/USER:USER during request processing.")

(defvar-unbound *current-chat*
  "Содержит текущий активный чат, с которым работает бот.")
