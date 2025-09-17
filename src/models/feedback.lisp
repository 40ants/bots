(uiop:define-package #:40ants-bots/models/feedback
  (:use #:cl)
  (:import-from #:mito)
  (:import-from #:40ants-bots/db/utils
                #:hash-to-db
                #:hash-from-db
                #:keyword-from-db
                #:keyword-to-db)
  (:import-from #:40ants-bots/models/message
                #:message)
  (:export #:feedback
           #:feedback-message
           #:feedback-message-id))
(in-package #:40ants-bots/models/feedback)


(mito:deftable feedback ()
  ((message :initarg :message
            :col-type message
            :references (message id)))
  (:table-name "bots.feedback"))
