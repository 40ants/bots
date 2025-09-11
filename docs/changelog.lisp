(uiop:define-package #:40ants-bots-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-bots-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP")
               :external-docs ("https://40ants.com/40ants-pg/"))
  (0.2.0 2025-09-11
         "* Removed 40ants-bots/db package. Now for database connection, 40ANTS-PG/CONNECTION:WITH-CONNECTION macro should be used.")
  (0.1.0 2023-02-05
         "* Initial version."))
