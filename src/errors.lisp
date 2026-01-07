(uiop:define-package #:40ants-bots/errors
  (:use #:cl)
  (:import-from #:alexandria
                #:required-argument)
  (:export #:40ants-bots-error
           #:bot-blocked-error
           #:bot-is-not-admin-error
           #:error-chat))
(in-package #:40ants-bots/errors)


(define-condition 40ants-bots-error (error)
  ())


(define-condition bot-blocked-error (40ants-bots-error)
  ((chat :initarg :chat
         :initform (required-argument "chat")
         :reader error-chat)))


(define-condition bot-is-not-admin-error (40ants-bots-error)
  ((chat :initarg :chat
         :initform (required-argument "chat")
         :reader error-chat)))

