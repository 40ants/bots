(uiop:define-package #:40ants-bots/admin/pages/frame
  (:use #:cl)
  (:import-from #:reblocks-ui2/html
                #:html)
  (:import-from #:reblocks-auth/models
                #:profile-metadata
                #:user-social-profiles
                #:profile-service-user-id
                #:profile-service
                #:get-nickname
                #:get-current-user)
  (:import-from #:reblocks-auth/core
                #:login-processor
                #:logout-processor
                #:render-buttons)
  (:import-from #:serapeum
                #:fmt)
  (:import-from #:reblocks/widgets/funcall-widget
                #:make-funcall-widget)
  (:import-from #:40ants-bots/admin/vars
                #:*default-title*
                #:*site-admins*)
  (:import-from #:40ants-routes/breadcrumbs
                #:breadcrumb-path
                #:breadcrumb-title)
  (:export #:make-page-frame))
(in-package #:40ants-bots/admin/pages/frame)


(defun user-telegram-profile ()
  (let* ((user (get-current-user))
         (profiles (when user
                     (user-social-profiles user))))
    (loop for profile in profiles
          thereis (and (eql (profile-service profile)
                            :telegram)
                       profile))))

(defun is-user-admin-p ()
  (let* ((profile (user-telegram-profile))
         (metadata (when profile
                     (profile-metadata profile))))
    (when (and profile
               (member (gethash "username" metadata)
                       *site-admins*
                       :test #'equal))
      (values t))))


;; (declaim (notinline render-frame))

(defun render-frame (content &key (title *default-title*))
  (let ((admin (is-user-admin-p))
        (crumbs (40ants-routes/breadcrumbs:get-breadcrumbs)))
    (html ((:header :class "flex"
                    (:div :class "flex-auto text-4xl"
                          title)
                    (cond
                      ((or (typep content 'login-processor)
                           (typep content 'reblocks-auth:logout-processor))
                       (:div content))
                      (t
                       (cond
                         ((is-user-admin-p)
                          (let* ((profile (user-telegram-profile))
                                 (username (gethash "username" (profile-metadata profile))))
                            (:div (:span "You logged as")
                                  (:span " ")
                                  (:a :class "text-blue-600"
                                      :href "/logout"
                                      username))))
                         (t
                          (:div (render-buttons)))))))
            (when crumbs
              (:div :class "flex gap-2"
                    (loop for crumb in crumbs
                          for idx upfrom 0
                          for last-elt = (= idx (1- (length crumbs)))
                          do (:a :class "text-blue-600"
                                 :href (breadcrumb-path crumb)
                                 (breadcrumb-title crumb))
                             (unless last-elt
                               (:span ">")))))
            (:div
             (cond
               ((or (typep content 'login-processor)
                    (typep content 'reblocks-auth:logout-processor))
                (:div content))
               (t
                (cond
                  (admin
                   (:div content))
                  (t
                   (:div :class "flex text-4xl"
                         "Требуется вход")))))))
          :css-classes "flex flex-col gap-8 mx-[1rem] sm:mx-[100px] md:mx-[200px] my-4")))


(defun make-page-frame (content &key (title *default-title*))
  (make-funcall-widget (lambda ()
                         (render-frame content :title title))))

