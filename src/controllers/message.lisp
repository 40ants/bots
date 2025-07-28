(uiop:define-package #:40ants-bots/controllers/message
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
  (:import-from #:serapeum
                #:->)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:export #:create-message
           #:get-message
           #:list-messages))
(in-package #:40ants-bots/controllers/message)


(-> create-message (keyword integer chat user string &key (:raw hash-table) (:incomingp boolean))
    (values message &optional))

(defun create-message (platform platform-id chat user text &key raw (incomingp nil))
  "Создает новое сообщение в базе данных."
  (mito:create-dao 'message
                   :platform platform
                   :platform-id platform-id
                   :chat chat
                   :user user
                   :text text
                   :incomingp incomingp
                   :raw (or raw (make-hash-table))))

(defun get-message (id)
  "Возвращает сообщение по его ID."
  (mito:find-dao 'message :id id))

(defun list-messages (&key (limit 100) (offset 0))
  "Возвращает список сообщений с пагинацией."
  (mito:select-dao 'message
    (limit limit)
    (offset offset)
    (order-by (:desc :created-at))))
