(uiop:define-package #:40ants-bots/controllers/chat
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/spec
                #:telegram-object)
  (:import-from #:log)
  (:import-from #:40ants-bots/models/chat
                #:chat-bot-is-blocked-p
                #:chat
                #:chat-id
                #:chat-platform
                #:chat-platform-id
                #:chat-type
                #:chat-raw
                #:chat-created-at
                #:chat-updated-at)
  (:import-from #:40ants-bots/vars
                #:*current-chat*)
  (:import-from #:sxql
                #:order-by
                #:offset
                #:limit)
  (:import-from #:40ants-bots/models/user
                #:user)
  (:import-from #:serapeum
                #:fmt
                #:soft-list-of
                #:->)
  (:import-from #:alexandria
                #:make-keyword)
  (:import-from #:40ants-bots/generics
                #:on-add-to-chat-as-member
                #:on-add-to-chat-as-admin)
  (:import-from #:mito
                #:object-id
                #:save-dao)
  (:import-from #:log4cl-extras/context
                #:with-fields)
  (:export #:create-chat
           #:get-chat-by-id
           #:get-chat-by-platform-id
           #:list-chats
           #:get-or-create-chat
           #:get-current-chat
           #:get-private-chat
           #:get-chat-title
           #:get-chat-url
           #:get-chat-from
           #:get-chat-username))
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


(defun get-chat-by-platform-id (platform platform-id)
  "Находит чат по platform, platform-id и type."
  (mito:find-dao 'chat
                 :platform platform
                 :platform-id platform-id))


(defun list-chats (&key (limit 100) (offset 0))
  "Возвращает список чатов с пагинацией."
  (mito:select-dao 'chat
    (limit limit)
    (offset offset)
    (order-by (:desc :created-at))))


(defun get-or-create-chat (platform platform-id &key (type :chat) raw)
  "Находит или создает чат по platform, platform-id и type."
  (or (get-chat-by-platform-id platform platform-id)
      (create-chat platform platform-id :type type :raw raw)))


(defun get-current-chat ()
  "Возвращает текущий активный чат из переменной *current-chat*."
  (unless *current-chat*
    (error "Use GET-CURRENT-CHAT during message processing."))
  *current-chat*)


(-> get-private-chat ((or integer user))
    (values (or null chat)
            &optional))

(defun get-private-chat (user)
  (etypecase user
    (integer
     (first
      (mito:select-by-sql 'chat
                          "select ch.*
from bots.chats as ch
join bots.users as u on u.platform = ch.platform and u.platform_id = ch.platform_id
where u.id = ?"
                          :binds (list user))))
    (user
     (mito:find-dao 'chat
                    :platform (40ants-bots/models/user:user-platform user)
                    :platform-id (40ants-bots/models/user:user-platform-id user)))))


(-> get-chat-title (chat)
    (values (or null string) &optional))


(defun get-chat-title (chat)
  (values
   (gethash "title"
            (chat-raw chat))))


(-> get-chat-username (chat)
    (values (or null string) &optional))


(defun get-chat-username (chat)
  (values
   (gethash "username"
            (chat-raw chat))))


(-> get-chat-url (chat)
    (values (or null string) &optional))


(defun get-chat-url (chat)
  "Returns URL for public chat."
  (let ((username (gethash "username"
                           (chat-raw chat))))
    (when username
      (fmt "https://t.me/~A" username))))


(-> get-all-chats ()
    (soft-list-of chat))

(defun get-all-chats ()
  (nth-value 0 (mito:select-dao 'chat)))


(defgeneric get-chat-from (platform obj)
  (:method ((platform (eql :telegram)) (obj telegram-object))
    (let* ((api-chat (cl-telegram-bot2/pipeline::get-chat obj)))
      (when api-chat
        (let* ((chat-platform-id (cl-telegram-bot2/api:chat-id api-chat))
               (chat-type (make-keyword (string-upcase
                                         (or (cl-telegram-bot2/api::chat-type api-chat)
                                             (error "No chat type")))))
               (chat-as-json (cl-telegram-bot2/spec::unparse api-chat)))
          (get-or-create-chat :telegram
                              chat-platform-id
                              :type chat-type
                              :raw chat-as-json))))))


(defun update-blocked-status (chat &key (is-blocked (error "is-blocked is required argument")))
  (with-fields (:chat-id (object-id chat))
    (if is-blocked
        (log:info "Bot was blocked in chat")
        (log:info "Bot was unblocked in chat"))
  
    (setf (chat-bot-is-blocked-p chat)
          is-blocked)
    (save-dao chat)))


(defmethod on-add-to-chat-as-admin ((bot t) (platform t) (chat t))
  (update-blocked-status chat :is-blocked nil)
  (values))


(defmethod on-add-to-chat-as-member ((bot t) (platform t) (chat t))
  (update-blocked-status chat :is-blocked nil)
  (values))


(defmethod 40ants-bots/generics:on-remove-from-chat ((bot t) (platform t) (chat t))
  (update-blocked-status chat :is-blocked t)
  (values))
