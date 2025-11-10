(uiop:define-package #:40ants-bots/controllers/payment
  (:use #:cl)
  (:import-from #:40ants-bots/models/payment
                #:payment-amount
                #:payment-state
                #:payment
                #:payment-id
                #:payment-user
                #:payment-text
                #:payment-raw
                #:payment-created-at)
  (:import-from #:sxql
                #:order-by
                #:offset
                #:limit)
  (:import-from #:serapeum
                #:->)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:export #:create-payment
           #:get-payment-by-id
           #:move-payment-to-paid))
(in-package #:40ants-bots/controllers/payment)


(-> create-payment (keyword chat user keyword
                    &key
                    (:amount number)
                    (:raw hash-table)
                    (:extra-info hash-table))
    (values payment &optional))

(defun create-payment (platform chat user currency &key amount raw extra-info)
  "Creates new payment."
  (mito:create-dao 'payment
                   :platform platform
                   :chat chat
                   :user user
                   :state :pending
                   :currency currency
                   :amount amount
                   :raw (or raw (make-hash-table))
                   :extra-info (or extra-info (make-hash-table))))

(defun get-payment-by-id (id)
  "Returns payment by ID."
  (mito:find-dao 'payment
                 :id id))



(-> move-payment-to-success (payment &key (:amount number) (:raw hash-table))
    (values &optional))

(defun move-payment-to-paid (payment &key amount raw)
  (setf (payment-state payment)
        :paid)
  (when amount
    (setf (payment-amount payment)
          amount))
  (when raw
    (setf (payment-raw payment)
          raw))
  (mito:save-dao payment)
  (values))
