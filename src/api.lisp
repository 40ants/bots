(uiop:define-package #:40ants-bots/api
  (:use #:cl)
  (:import-from #:cl-telegram-bot2/high
                #:*collected-messages*
                #:defun-with-same-keys)
  (:import-from #:serapeum
                #:->)
  (:import-from #:cl-telegram-bot2/errors
                #:error-description
                #:telegram-error)
  (:import-from #:40ants-bots/controllers/chat
                #:update-blocked-status
                #:get-private-chat)
  (:import-from #:40ants-bots/models/chat
                #:chat-platform-id)
  (:import-from #:log4cl-extras/error
                #:with-log-unhandled)
  (:import-from #:str
                #:replace-all)
  (:import-from #:40ants-bots/errors
                #:bot-is-not-admin-error
                #:bot-blocked-error)
  (:export
   #:send-message
   #:send-chat-action))
(in-package #:40ants-bots/api)


(-> %get-chat-from ((or 40ants-bots/models/chat:chat
                        40ants-bots/models/user:user))
    (values 40ants-bots/models/chat:chat &optional))

(defun %get-chat-from (chat-or-user)
  (etypecase chat-or-user
    (40ants-bots/models/chat:chat
     chat-or-user)
    (40ants-bots/models/user:user
     (get-private-chat chat-or-user))))


(-> %get-chat-id-from ((or 40ants-bots/models/chat:chat
                           40ants-bots/models/user:user))
    (values integer &optional))

(defun %get-chat-id-from (chat-or-user)
  (chat-platform-id (%get-chat-from chat-or-user)))


(defun-with-same-keys (send-message cl-telegram-bot2/api:send-message)
                      (chat-or-user text &rest rest)
  (let* ((chat (%get-chat-from chat-or-user))
         (platform-chat-id (%get-chat-id-from chat))
         (message (handler-case
                      (with-log-unhandled ()
                        (apply #'cl-telegram-bot2/api:send-message
                               platform-chat-id
                               text
                               rest))
                    (telegram-error (err)
                      (let ((description (error-description err)))
                        (cond
                          ((string= description
                                    "Forbidden: bot was blocked by the user")
                           (log:warn "Bot was blocked in the chat"
                                     platform-chat-id)
                           (update-blocked-status chat :is-blocked t)
                           (error 'bot-blocked-error :chat chat))
                          ((string= description
                                    "Bad Request: need administrator rights in the channel chat")
                           (log:warn "Unable to reply to chat ~S because bot needs administration rights on this channel"
                                     platform-chat-id)
                           (error 'bot-is-not-admin-error :chat chat))
                          (t
                           ;; Reraise error
                           (error err))))))))
    (when (and (boundp '*collected-messages*)
               message)
      (push message *collected-messages*))
    (values message)))



(defun-with-same-keys (send-chat-action cl-telegram-bot2/api:send-chat-action)
                      (chat-or-user action &rest rest)
  "Use this method when you need to tell the user that something is happening on the bot's side.

   Second argument should be a keyword denoting an action to broadcast.
   Choose one, depending on what the user is about to receive:

   - :TYPING for text messages
   - :UPLOAD-PHOTO for photos
   - :RECORD-VIDEO or :UPLOAD-VIDEO for videos
   - :RECORD-VOICE or :UPLOAD-VOICE for voice notes
   - :UPLOAD-DOCUMENT for general files
   - :CHOOSE-STICKER for stickers
   - :FIND-LOCATION for location data
   - :RECORD-VIDEO_note or :UPLOAD-VIDEO_note for video notes"
  (let* ((chat-id (%get-chat-id-from chat-or-user)))
    (handler-case
        (with-log-unhandled ()
          (let ((action (replace-all "-" "_"
                                     (string-downcase action))))
            (apply #'cl-telegram-bot2/api:send-chat-action
                   chat-id
                   action
                   rest)))
      (telegram-error (err)
        ;; Process
        ;; Forbidden: bot was blocked by the user
                      
        (when (string= (error-description err)
                       "Bad Request: need administrator rights in the channel chat")
          (log:warn "Unable to reply to chat ~S because bot needs administration rights on this channel"
                    chat-id)
          (return-from send-chat-action nil))))
    (values)))
