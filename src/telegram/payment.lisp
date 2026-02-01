(uiop:define-package #:40ants-bots/telegram/payment
  (:use #:cl)
  (:import-from #:serapeum
                #:dict
                #:soft-list-of
                #:->)
  (:import-from #:cl-telegram-bot2/term/back
                #:back-to-id)
  (:import-from #:cl-telegram-bot2/actions/send-text
                #:send-text)
  (:import-from #:cl-telegram-bot2/workflow
                #:workflow-blocks
                #:workflow-block)
  (:import-from #:cl-telegram-bot2/actions/send-invoice
                #:*default-prepare-text*
                #:*default-on-cancel*
                #:*default-pay-button-text*
                #:*default-cancel-button-text*)
  (:import-from #:40ants-bots/controllers/chat
                #:get-current-chat)
  (:import-from #:40ants-bots/controllers/user
                #:get-current-user)
  (:import-from #:40ants-bots/controllers/payment
                #:move-payment-to-paid
                #:get-payment-by-id
                #:create-payment)
  (:import-from #:cl-telegram-bot2/state-with-commands
                #:command)
  (:import-from #:alexandria
                #:length=)
  (:import-from #:log)
  (:import-from #:cl-telegram-bot2/api
                #:successful-payment-total-amount
                #:successful-payment-invoice-payload)
  (:import-from #:40ants-bots/models/payment
                #:payment-extra-info)
  (:import-from #:cl-telegram-bot2/spec)
  (:import-from #:40ants-bots/generics
                #:on-success-payment)
  (:import-from #:40ants-bots/controllers/bot
                #:get-current-bot)
  (:import-from #:log4cl-extras/context
                #:with-fields)
  (:import-from #:mito
                #:object-id)
  (:import-from #:secret-values
                #:secret-value)
  (:export
   #:send-invoice))
(in-package #:40ants-bots/telegram/payment)


(defun process-success-payment (successful-payment)
  (log:info "Processing success payment" successful-payment)
  (let* ((payment-id-str (successful-payment-invoice-payload successful-payment))
         (payment-id (parse-integer payment-id-str))
         (payment (get-payment-by-id payment-id)))
    (when payment
      (let* ((extra (payment-extra-info payment))
             (send-text (gethash "send-text" extra))
             (back-to-id (gethash "back-to-id" extra)))

        (move-payment-to-paid payment
                              :amount (/ (successful-payment-total-amount successful-payment)
                                         100)
                              :raw (cl-telegram-bot2/spec::unparse successful-payment))

        ;; Returning actions in response to successful-payment:
        (append
         (remove-if #'null
                    (list (when send-text
                            (send-text send-text))
                          (when back-to-id
                            (back-to-id back-to-id))))
         (uiop:ensure-list
          (on-success-payment (get-current-bot)
                              payment)))))))


(-> send-invoice ((or string symbol)
                  (or string symbol)
                  (or string secret-value)
                  keyword
                  cl-telegram-bot2/actions/send-invoice:prices-list
                  &key
                  (:on-cancel (or workflow-block
                                  workflow-blocks
                                  symbol))
                  (:prepare-text (or string
                                     symbol))
                  (:pay-button-text (or string
                                        symbol))
                  (:cancel-button-text (or string
                                           symbol))
                  (:commands (soft-list-of command))
                  (:extra-info hash-table))
    (values cl-telegram-bot2/actions/send-invoice:send-invoice &optional))

(defun send-invoice (title description provider-token currency prices
                     &key
                     (on-cancel *default-on-cancel*)
                     (prepare-text *default-prepare-text*)
                     (pay-button-text *default-pay-button-text*)
                     (cancel-button-text *default-cancel-button-text*)
                     commands
                     extra-info)
  (let* ((amount
           ;; User might provide a few labeled amounts.
           ;; If there is only one, then we will fill amount
           ;; from beginning. Otherwise, we will fill amount
           ;; when process success payment.
           (when (length= 1 prices)
             (/ (gethash "amount"
                         (first prices))
                ;; Telegram reuquires to specify
                ;; amount in cents
                100)))
         (chat (get-current-chat))
         (user (get-current-user))
         (payment (create-payment :telegram
                                  chat
                                  user
                                  currency
                                  :amount amount
                                  :extra-info (or extra-info
                                                  (dict)))))
    (with-fields (:chat-id (object-id chat)
                  :user-id (object-id user))
      (log:info "Sending invoice")
      (cl-telegram-bot2/actions/send-invoice:send-invoice
       title
       description
       ;; payload
       (princ-to-string (mito:object-id payment))
       provider-token
       (string-upcase currency)
       prices
       :on-success 'process-success-payment
       :on-cancel on-cancel
       :prepare-text prepare-text
       :pay-button-text pay-button-text
       :cancel-button-text cancel-button-text
       :commands commands))))
