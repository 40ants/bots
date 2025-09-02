(uiop:define-package #:40ants-bots/models/payment
  (:use #:cl)
  (:import-from #:mito)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:export #:payment
           #:payment-chat
           #:payment-chat-id
           #:payment-user
           #:payment-user-id
           #:payment-state
           #:payment-currency
           #:payment-amount
           #:payment-platform
           #:payment-extra-info
           #:payment-raw))
(in-package #:40ants-bots/models/payment)


(mito:deftable payment ()
  ((chat :initarg :chat
         :col-type chat
         :references (chat id))
   (user :initarg :user
         :col-type user
         :references (user id))
   (state :initarg :state
          :col-type :payment_state
          :type keyword
          :inflate #'keyword-from-db
          :deflate #'keyword-to-db)
   (currency :initarg :currency
             :col-type :text
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (amount :initarg :amount
           :col-type (or :null :decimal)
           :type rational)
   (platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (extra-info :initarg :extra-info
               :col-type :jsonb
               :type hash-table
               :inflate #'hash-from-db
               :deflate #'hash-to-db)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:table-name "bots.payments"))
