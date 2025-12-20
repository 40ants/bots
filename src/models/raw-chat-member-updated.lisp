(uiop:define-package #:40ants-bots/models/raw-chat-member-updated
  (:use #:cl)
    (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db)
  (:import-from #:40ants-doc/mito
                #:fixed-dao-table-class)
  (:export #:raw-chat-member-updated
           #:raw-chat-member-updated-raw))
(in-package #:40ants-bots/models/raw-chat-member-updated)


(defclass raw-chat-member-updated ()
  ((raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:metaclass fixed-dao-table-class)
  (:conc-name raw-chat-member-updated-)
  (:table-name "dwh.raw_chat_member_updated"))
