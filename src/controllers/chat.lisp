(uiop:define-package #:40ants-bots/controllers/chat
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
  (:import-from #:40ants-bots/vars
                #:*current-chat*)
  (:import-from #:sxql
                #:order-by
                #:offset
                #:limit)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:serapeum
                #:->)
  (:export #:create-chat
           #:get-chat-by-id
           #:get-chat-by-platform-id
           #:list-chats
           #:get-or-create-chat
           #:get-current-chat
           #:get-private-chat))
(in-package #:40ants-bots/controllers/chat)


(defmethod print-object ((obj chat) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~A ~A (~A)"
            (chat-platform obj)
            (chat-platform-id obj)
            (chat-type obj))))


(defun create-chat (platform platform-id &key (type :chat) raw)
  "Создает новый чат в базе данных."
  (mito:create-dao 'chat
                   :platform platform
                   :platform-id platform-id
                   :type type
                   :raw (or raw (make-hash-table))))


(defun get-chat-by-id (id)
  "Возвращает чат по его ID."
  (mito:find-dao 'chat :id id))


(defun get-chat-by-platform-id (platform platform-id &optional (type :chat))
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


(defun get-or-create-chat (platform platform-id &key (type :chat) raw)
  "Находит или создает чат по platform, platform-id и type."
  (or (get-chat-by-platform-id platform platform-id type)
      (create-chat platform platform-id :type type :raw raw)))


(defun get-current-chat ()
  "Возвращает текущий активный чат из переменной *current-chat*."
  (unless *current-chat*
    (error "Use GET-CURRENT-CHAT during message processing."))
  *current-chat*)


(-> get-private-chat (user)
    (values (or null chat)))

(defun get-private-chat (user)
  (mito:find-dao 'chat
                 :platform (40ants-bots/models/user:user-platform user)
                 :platform-id (40ants-bots/models/user:user-platform-id user)))
