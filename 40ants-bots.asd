#-asdf3.1 (error "40ants-bots requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "40ants-bots"
  :description "Framework for build products around chat bots. Includes bot DSL and admin interface for interacting with bot users."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/bots/"
  :source-control (:git "https://github.com/40ants/bots")
  :bug-tracker "https://github.com/40ants/bots/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("dbd-postgres"
               "mito"
               "40ants-bots/core"
               "40ants-bots/pipeline"
               "40ants-bots/controller/chat"
               "40ants-bots/controller/message"
               "40ants-bots/controller/user")
  :in-order-to ((test-op (test-op "40ants-bots-tests"))))
