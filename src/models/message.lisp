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
  (:export #:message
           #:message-id
           #:message-user
           #:message-text
           #:message-raw
           #:message-created-at
           #:message-incoming))
(in-package #:40ants-bots/models/message)


;; Attempt to silent docs-builder by declaring generic functions for
;; model slot accessors

(defgeneric message-chat (obj))


(mito:deftable message ()
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
  (:table-name "bots.messages"))
