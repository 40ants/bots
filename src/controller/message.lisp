(uiop:define-package #:40ants-bots/controller/message
  (:use #:cl)
  (:import-from #:40ants-bots/models/message
                #:message
                #:message-id
                #:message-user
                #:message-text
                #:message-raw
                #:message-created-at)
  (:import-from #:40ants-bots/db/utils
                #:with-transaction)
  (:import-from #:sxql
                #:order-by
                #:offset
                #:limit)
  (:export #:create-message
           #:get-message
           #:list-messages))
(in-package #:40ants-bots/controller/message)


(defun create-message (user text &optional raw)
  "Создает новое сообщение в базе данных."
  (with-transaction ()
    (mito:create-dao 'message
                     :user user
                     :text text
                     :raw (or raw (make-hash-table)))))

(defun get-message (id)
  "Возвращает сообщение по его ID."
  (mito:find-dao 'message :id id))

(defun list-messages (&key (limit 100) (offset 0))
  "Возвращает список сообщений с пагинацией."
  (mito:select-dao 'message
    (limit limit)
    (offset offset)
    (order-by (:desc :created-at))))
