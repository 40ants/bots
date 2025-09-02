(uiop:define-package #:40ants-bots/generics
  (:use #:cl)
  (:export #:on-success-payment))
(in-package #:40ants-bots/generics)


(defgeneric on-success-payment (bot payment)
  (:documentation "Called when platform sends an approve of successful payment.

First argument will be a platform dependent bot instance,
the second instance will be a mito dao object of 40ANTS-BOTS/MODELS/PAYMENT:PAYMENT type.

The end user must define a method to process successul payments."))
