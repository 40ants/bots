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
  (:export #:message
           #:message-user
           #:message-text
           #:message-raw
           #:message-incoming
           #:message-chat
           #:message-chat-id
           #:message-user-id
           #:message-platform
           #:message-platform-id))
(in-package #:40ants-bots/models/message)


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


(defun set-methods-sources (class-name)
  "Обновляет source для всех методов класса у которых source не задан."
  (loop with class = (find-class class-name)
        for method in (closer-mop:specializer-direct-generic-functions class)
        for method-source = (slot-value method 'sb-pcl::source)
        unless method-source
          do (setf (slot-value method 'sb-pcl::source)
                   (slot-value class 'sb-pcl::source))))


(set-methods-sources 'message)
