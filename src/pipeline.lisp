(uiop:define-package #:40ants-bot/pipeline
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/api)
  (:import-from #:cl-telegram-bot2/pipeline)
  (:import-from #:40ants-bots/bot
                #:bot)
  (:import-from #:40ants-bots/vars
                #:*user*)
  (:import-from #:40ant-bots/controller/user
                #:get-or-create-user))
(in-package #:40ants-bot/pipeline)


(defvar *updates* nil)

(defmethod cl-telegram-bot2/generics:process :around ((bot bot) (state null) (update cl-telegram-bot2/api:update))
  (40ants-bots/db:with-connection ()
    (let* ((api-user (cl-telegram-bot2/pipeline::get-user update))
           (platform :telegram)
           (platform-id (cl-telegram-bot2/api:user-id api-user))
           (user-as-json (cl-telegram-bot2/spec::unparse api-user))
           (user (get-or-create-user platform
                                     platform-id
                                     (cl-telegram-bot2/api:user-username api-user)
                                     user-as-json))
           (*user* user))
      (break)
      (push (list state update *user*)
            *updates*)
      (call-next-method))))
