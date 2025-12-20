(uiop:define-package #:40ants-bots/controllers/dwh
  (:use #:cl)
  (:import-from #:serapeum
                #:->)
  (:import-from #:cl-telegram-bot2/api
                #:update)
  (:import-from #:40ants-bots/models/raw-chat-member-updated
                #:raw-chat-member-updated)
  (:import-from #:cl-telegram-bot2/spec
                #:unparse)
  (:import-from #:mito
                #:create-dao)
  (:import-from #:40ants-pg/connection
                #:with-connection)
  (:export
   #:maybe-save-update-to-dwh))
(in-package #:40ants-bots/controllers/dwh)


(-> maybe-save-update-to-dwh (update)
    (values))


(defun maybe-save-update-to-dwh (update)
  (cond
    ((slot-boundp update 'cl-telegram-bot2/api:chat-member)
     (with-connection (:cached nil)
       (let ((result (create-dao 'raw-chat-member-updated
                                 :raw (unparse update))))
         (log:info "Update was saved to database" result)))))
  (values))
