(uiop:define-package #:40ants/controllers/feedback
  (:use #:cl)
  (:import-from #:serapeum
                #:->)
  (:import-from #:40ants-bots/models/feedback
                #:feedback)
  (:import-from #:mito
                #:create-dao)
  (:export #:register-feedback-message))
(in-package #:40ants/controllers/feedback)


(-> register-feedback-message (integer)
    (values feedback &optional))


(defun register-feedback-message (message-id)
  (create-dao 'feedback
              :message-id message-id))
