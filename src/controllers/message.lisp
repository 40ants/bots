(uiop:define-package #:40ants-bots/controllers/message
  (:use #:cl)
  (:import-from #:40ants-bots/models/message
                #:message
                #:message-id
                #:message-user
                #:message-text
                #:message-raw
                #:message-created-at)
  (:import-from #:sxql
                #:where
                #:order-by
                #:offset
                #:limit)
  (:import-from #:serapeum
                #:soft-list-of
                #:->)
  (:import-from #:40ants-bots/models/chat
                #:chat)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:40ants-pg/transactions
                #:with-transaction)
  (:import-from #:mito
                #:object-id)
  (:export #:create-message
           #:get-message
           #:list-messages
           #:get-chat-messages))
(in-package #:40ants-bots/controllers/message)


(defparameter *new-version-query*
  "
with updated_records as (
  update bots.messages
     set is_actual = false
   where platform = ?
     and platform_id = ?
  returning version
)
select coalesce(max(version), -1) + 1 as version
from updated_records
")


(-> create-message (keyword integer chat (or null user) string &key (:raw hash-table) (:incomingp boolean))
    (values message &optional))

(defun create-message (platform platform-id chat user text &key raw (incomingp nil))
  "Создает новое сообщение в базе данных."
  (with-transaction ()
    (let ((new-message-version
            (getf (first
                   (mito:retrieve-by-sql *new-version-query*
                                         :binds (list (string-downcase platform)
                                                      platform-id)))
                  :version)))
      (mito:create-dao 'message
                       :platform platform
                       :platform-id platform-id
                       :version new-message-version
                       :is-actual t
                       :chat chat
                       :user user
                       :text text
                       :incomingp incomingp
                       :raw (or raw (make-hash-table))))))


(-> get-message (integer)
    (values (or null message)
            &optional))

(defun get-message (id)
  "Возвращает сообщение по его ID."
  (mito:find-dao 'message :id id))


(-> list-messages (&key (:limit integer) (:offset integer))
    (values (soft-list-of message)
            &optional))

(defun list-messages (&key (limit 100) (offset 0))
  "Возвращает список сообщений с пагинацией."
  (values
   (mito:select-dao 'message
     (limit limit)
     (offset offset)
     (order-by (:desc :created-at)))))


(-> get-chat-messages (chat &key (:limit (or null integer)))
    (values (soft-list-of message)
            &optional))

(defun get-chat-messages (chat &key (limit 10))
  "Returns messages sent by user to any chats.

   Previously used in admin interface, but was replaced with a function get-chat-messages
   to extract all messages (not only from the user), sent to the chat of the bot with user."
  (values
   (mito:select-dao 'message
     (where (:= :chat_id (object-id chat)))
     (order-by (:desc :created_at))
     (limit limit))))
