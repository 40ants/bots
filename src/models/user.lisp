(uiop:define-package #:40ants-bots/models/user
  (:use #:cl)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:export #:user
           #:user-platform
           #:user-platform-id
           #:user-username
           #:user-raw))
(in-package #:40ants-bots/models/user)


(mito:deftable user ()
  ((platform :initarg :platform
             :col-type :supported_platforms
             :type keyword
             :inflate #'keyword-from-db
             :deflate #'keyword-to-db)
   (platform-id :initarg :platform-id
                :col-type :bigint
                :type keyword)
   (username :initarg :username
             :col-type :text
             :type string)
   (raw :initarg :raw
        :col-type :jsonb
        :type hash-table
        :inflate #'hash-from-db
        :deflate #'hash-to-db))
  (:table-name "bots.users"))
