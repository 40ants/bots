(uiop:define-package #:40ants-bots/models/delayed-trigger
  (:use #:cl)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:local-time
                #:timestamp)
  (:export #:delayed-trigger
           #:delayed-trigger-name
           #:delayed-trigger-chat
           #:delayed-trigger-callback
           #:delayed-trigger-extra-arguments
           #:delayed-trigger-processed-at
           #:delayed-trigger-results
           #:delayed-trigger-check-at
           #:delayed-trigger-chat-id
           #:delayed-trigger-attempt-number
           #:delayed-trigger-failed-at
           #:delayed-trigger-cancelled-at))
(in-package #:40ants-bots/models/delayed-trigger)


(mito:deftable delayed-trigger ()
  ((name :initarg :name
         :col-type :text
         :type string)
   (chat :initarg :chat
         :col-type chat
         :references (chat id))
   (callback :initarg :callback
             :col-type :text
             :type string
             :documentation "Fully qualified symbol name that should be bound to a function to execute.")
   (extra-arguments :initarg :extra-arguments
                    :col-type :jsonb
                    :type hash-table
                    :inflate #'hash-from-db
                    :deflate #'hash-to-db
                    :documentation "Optional JSONB data to be passed as keyword arguments to the callback function.")
   (check-at :initarg :check-at
             :col-type :timestamptz
             :type timestamp
             :documentation "Timestamp after which this trigger should be processed. May be changed while incrementing attempts.")
   (processed-at :initarg :processed-at
                 :col-type (or :null :timestamptz)
                 :type (or null timestamp)
                 :documentation "Will be set to a timestamp after successful trigger processing.")
   (failed-at :initarg :failed-at
              :col-type (or :null :timestamptz)
              :type (or null timestamp)
              :documentation "Will be set to a timestamp after last unsuccessful trigger processing.")
   (cancelled-at :initarg :cancelled-at
                 :col-type (or :null :timestamptz)
                 :type (or null timestamp)
                 :documentation "Will be set to a timestamp if trigger will be cancelled.")
   (attempt-number :initform 1
                   :col-type :integer
                   :type integer)
   (results :initarg :results
            :col-type (:or :null :jsonb)
            :type (or null hash-table)
            :inflate #'hash-from-db
            :deflate #'hash-to-db))
  (:table-name "bots.delayed_triggers"))
