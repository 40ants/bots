(uiop:define-package #:40ants-bots/controller/chat
  (:use #:cl)
  (:import-from #:40ants-bots/models/chat
                #:chat
                #:chat-id
                #:chat-platform
                #:chat-platform-id
                #:chat-type
                #:chat-raw
                #:chat-created-at
                #:chat-updated-at)
  (:import-from #:40ants-bots/db/utils
                #:with-transaction)
  (:import-from #:sxql
                #:order-by
                #:offset
                #:limit)
  (:export #:create-chat
           #:get-chat
           #:find-chat-by-platform-id
           #:list-chats))
(in-package #:40ants-bots/controller/chat)


(defun create-chat (platform platform-id &key (type :chat) raw)
  "Создает новый чат в базе данных."
  (mito:create-dao 'chat
                   :platform platform
                   :platform-id platform-id
                   :type type
                   :raw (or raw (make-hash-table))))

(defun get-chat (id)
  "Возвращает чат по его ID."
  (mito:find-dao 'chat :id id))


(defun find-chat-by-platform-id (platform platform-id &optional (type :chat))
  "Находит чат по platform, platform-id и type."
  (mito:find-dao 'chat
                 :platform platform
                 :platform-id platform-id
                 :type type))

(defun list-chats (&key (limit 100) (offset 0))
  "Возвращает список чатов с пагинацией."
  (mito:select-dao 'chat
    (limit limit)
    (offset offset)
    (order-by (:desc :created-at))))
