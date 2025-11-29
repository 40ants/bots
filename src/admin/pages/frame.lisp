(uiop:define-package #:40ants-bots/admin/pages/frame
  (:use #:cl)
  (:import-from #:reblocks-ui2/html
                #:html)
  (:export #:make-page-frame))
(in-package #:40ants-bots/admin/pages/frame)


(defun make-page-frame (content)
  (html ((:h3 "Some header will be here")
          (:div content))
        :css-classes "mx-[1rem] sm:mx-[100px] md:mx-[200px] my-4"))

