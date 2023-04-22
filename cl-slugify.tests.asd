(asdf:defsystem #:cl-slugify.tests
  :description "unit testing for cl-slugify."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.1"
  :serial t
  :depends-on (#:fiveam #:cl-slugify)
  :components ((:file "tests")))
