(uiop:define-package #:40ants-bots/models/message
  (:use #:cl)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:export #:message
           #:message-id
           #:message-user
           #:message-text
           #:message-raw
           #:message-created-at))
(in-package #:40ants-bots/models/message)


(mito:deftable message ()
  ((chat :initarg :chat
         :col-type chat
         :references ((chat id)))
   (user :initarg :user
         :col-type user
         :references ((user id)))
   (platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (platform-id :initarg :platform-id
                :col-type :bigint)
   (text :initarg :text
         :col-type :text
         :type string)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:table-name "bots.messages"))
