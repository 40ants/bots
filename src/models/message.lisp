(uiop:define-package #:40ants-bots/models/message
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
  (:import-from #:serapeum
                #:eval-always)
  (:import-from #:40ants-doc/mito
                #:fixed-dao-table-class)
  (:export #:message
           #:message-user
           #:message-text
           #:message-raw
           #:message-incoming
           #:message-chat
           #:message-chat-id
           #:message-user-id
           #:message-platform
           #:message-platform-id
           #:message-version
           #:message-is-actual))
(in-package #:40ants-bots/models/message)


(defclass message ()
  ((chat :initarg :chat
         :col-type chat
         :references (chat id))
   (user :initarg :user
         :col-type (or :null user)
         :references (user id))
   (platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (platform-id :initarg :platform-id
                :col-type :bigint)
   (version :initarg :version
            :col-type :bigint
            :type integer)
   (is-actual :initarg :is-actual
              :col-type :boolean
              :initform t
              :type boolean)
   (text :initarg :text
         :col-type :text
         :type string)
   (incoming :initarg :incomingp
             :col-type :boolean
             :type boolean)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:metaclass fixed-dao-table-class)
  (:conc-name message-)
  (:table-name "bots.messages"))
