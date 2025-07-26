(uiop:define-package #:40ants-bots/models/chat
  (:use #:cl)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:export #:chat
           #:chat-id
           #:chat-platform
           #:chat-platform-id
           #:chat-raw
           #:chat-created-at
           #:chat-updated-at))
(in-package #:40ants-bots/models/chat)


(mito:deftable chat ()
  ((platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (platform-id :initarg :platform-id
                :col-type :bigint)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db)
   (created-at :initarg :created-at
               :col-type :timestamptz
               :initform (local-time:now))
   (updated-at :initarg :updated-at
               :col-type :timestamptz
               :initform (local-time:now)))
  (:table-name "bots.chats"))
