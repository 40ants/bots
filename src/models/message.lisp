(uiop:define-package #:40ants-bots/models/message
  (:use #:cl)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:export #:message
           #:message-id
           #:message-user
           #:message-text
           #:message-raw
           #:message-created-at))
(in-package #:40ants-bots/models/message)


(mito:deftable message ()
  ((user :initarg :user
         :col-type user
         :references ((user id)))
   (text :initarg :text
         :col-type :text
         :type string)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db)
   (created-at :initarg :created-at
               :col-type :timestamptz
               :initform (local-time:now)))
  (:table-name "bots.messages"))
