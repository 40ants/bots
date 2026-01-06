(uiop:define-package #:40ants-bots/generics
  (:use #:cl)
  (:export #:on-success-payment
           #:on-remove-from-chat
           #:on-add-to-chat-as-member
           #:on-add-to-chat-as-admin))
(in-package #:40ants-bots/generics)


(defgeneric on-success-payment (bot payment)
  (:documentation "Called when platform sends an approve of successful payment.

First argument will be a platform dependent bot instance,
the second instance will be a mito dao object of 40ANTS-BOTS/MODELS/PAYMENT:PAYMENT type.

The end user must define a method to process successul payments.

Returned value should be a NIL or a list of bot actions or a state."))


(defgeneric on-add-to-chat-as-admin (bot platform chat)
  (:documentation "Called when bot was added to the chat as admin.")
  (:method ((bot t) (platform t) (chat t))
    (values)))


(defgeneric on-add-to-chat-as-member (bot platform chat)
  (:documentation "Called when bot was added to the chat as usual member.")
  (:method ((bot t) (platform t) (chat t))
    (values)))


(defgeneric on-remove-from-chat (bot platform chat)
  (:documentation "Called when bot was removed from the chat.")
  (:method ((bot t) (platform t) (chat t))
    (values)))
