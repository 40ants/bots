(uiop:define-package #:40ants-bots/utils
  (:use #:cl)
  (:import-from #:local-time
                #:format-timestring))
(in-package #:40ants-bots/utils)


(defparameter +date-format+
  '((:year 4) #\- (:month 2) #\- (:day 2)
    #\Space
    (:hour 2) #\: (:min 2)))


(defun format-date (ts)
  (format-timestring nil
                     ts
                     :format +date-format+))
