(defsystem "40ants-bots-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/bots/"
  :class :package-inferred-system
  :description "Provides tests for 40ants-bots."
  :source-control (:git "https://github.com/40ants/bots")
  :bug-tracker "https://github.com/40ants/bots/issues"
  :pathname "t"
  :depends-on ("40ants-bots-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
