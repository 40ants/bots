(uiop:define-package #:40ants-bots/models/chat
  (:use #:cl)
  (:import-from #:mito)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:export #:chat
           #:chat-platform
           #:chat-platform-id
           #:chat-type
           #:chat-raw
           #:chat-bot-is-blocked-p))
(in-package #:40ants-bots/models/chat)


(mito:deftable chat ()
  ((platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (platform-id :initarg :platform-id
                :col-type :bigint)
   (type :initarg :type
         :col-type :chat_types
         :type keyword
         :inflate #'keyword-from-db
         :deflate #'keyword-to-db
         :initform :chat)
   (bot-is-blocked :initarg :bot-is-blocked
                   :initform nil
                   :col-type :boolean
                   :type boolean
                   :accessor chat-bot-is-blocked-p)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:table-name "bots.chats"))
