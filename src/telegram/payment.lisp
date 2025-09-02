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
  (:import-from #:cl-telegram-bot2/actions/send-invoice)
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

        (on-success-payment (get-current-bot)
                            payment)
        
        (remove-if #'null
                   (list (when send-text
                           (send-text send-text))
                         (when back-to-id
                           (back-to-id back-to-id))))))))


;; TODO: think how to support (or string symbol) for title, description, prices
(-> send-invoice (string
                  string
                  string
                  keyword
                  cl-telegram-bot2/actions/send-invoice:prices-list
                  &key
                  (:commands (soft-list-of command))
                  (:extra-info hash-table))
    (values cl-telegram-bot2/actions/send-invoice:send-invoice &optional))

(defun send-invoice (title description provider-token currency prices &key commands extra-info)
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
         (payment (create-payment :telegram
                                  (get-current-chat)
                                  (get-current-user)
                                  currency
                                  :amount amount
                                  :extra-info (or extra-info
                                                  (dict)))))
    (cl-telegram-bot2/actions/send-invoice:send-invoice
     title
     description
     ;; payload
     (princ-to-string (mito:object-id payment))
     provider-token
     (string-upcase currency)
     prices
     :on-success 'process-success-payment
     :commands commands)))
