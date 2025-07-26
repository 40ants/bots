(defsystem "40ants-bots-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/bots/"
  :class :package-inferred-system
  :description "Provides documentation for 40ants-bots."
  :source-control (:git "https://github.com/40ants/bots")
  :bug-tracker "https://github.com/40ants/bots/issues"
  :pathname "docs"
  :depends-on ("40ants-bots"
               "40ants-bots-docs/index"))
