(uiop:define-package #:40ants-bots/telegram/feedback
  (:use #:cl)
  (:import-from #:serapeum
                #:dict
                #:soft-list-of
                #:->)
  (:import-from #:cl-telegram-bot2/term/back
                #:back
                #:back-to-id)
  (:import-from #:cl-telegram-bot2/actions/send-text
                #:send-text)
  (:import-from #:cl-telegram-bot2/actions/send-invoice)
  (:import-from #:40ants-bots/controllers/chat
                #:get-current-chat)
  (:import-from #:40ants-bots/controllers/user
                #:get-current-user)
  (:import-from #:cl-telegram-bot2/state-with-commands
                #:command)
  (:import-from #:alexandria
                #:length=)
  (:import-from #:log)
  (:import-from #:40ants-bots/controllers/bot
                #:get-current-bot)
  (:import-from #:cl-telegram-bot2/state
                #:state)
  (:import-from #:cl-telegram-bot2/states/ask-for-text
                #:ask-for-text)
  (:import-from #:cl-telegram-bot2/states/base
                #:var)
  (:import-from #:40ants/controllers/feedback
                #:register-feedback-message)
  (:export #:request-feedback))
(in-package #:40ants-bots/telegram/feedback)


(defun save-feedback ()
  (log:info "Saving feedback from user")

  (let ((message-id (var "40bots:last-incoming-message-id"))
        (thank-you-message (var "40bots:thank-you-message"))
        (back-to-id (var "40bots:back-to-id"))
        (response nil))
    (cond
      (message-id
       (register-feedback-message message-id))
      (t
       (log:error "There is no 40bots:last-incoming-message-id")))

    ;; Making a list of actions to respond user
    (when thank-you-message
      (push (send-text thank-you-message)
            response))

    (push
     (cond
       (back-to-id
        (back-to-id back-to-id))
       (t
        (back)))
     response)
    
    (reverse response)))


(-> request-feedback (string string &key (:back-to-id (or null string)))
    (values state &optional))


(defun request-feedback (prompt thank-you-message &key back-to-id)
  (ask-for-text prompt
                :on-success '(save-feedback)
                :vars (dict "40bots:thank-you-message" thank-you-message
                            "40bots:back-to-id" back-to-id)))
