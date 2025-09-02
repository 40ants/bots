(uiop:define-package #:40ants-bots/controllers/bot
  (:use #:cl)
  (:import-from #:40ants-bots/vars
                #:*current-bot*)
  (:export #:get-current-bot))
(in-package #:40ants-bots/controllers/bot)


(defun get-current-bot ()
  "Возвращает инстанс текущего бота из переменной *current-bot*."
  (unless *current-bot*
    (error "Use GET-CURRENT-BOT during message processing."))
  *current-bot*)
