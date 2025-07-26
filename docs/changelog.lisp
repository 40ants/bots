(uiop:define-package #:40ants-bots-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-bots-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"))
  (0.1.0 2023-02-05
         "* Initial version."))
