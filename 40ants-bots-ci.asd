(defsystem "40ants-bots-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/bots/"
  :class :package-inferred-system
  :description "Provides CI settings for 40ants-bots."
  :source-control (:git "https://github.com/40ants/bots")
  :bug-tracker "https://github.com/40ants/bots/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "40ants-bots-ci/ci"))
