(asdf:defsystem #:cl-slugify
  :description "converts a string into a slug representation."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-unac)
  :components ((:file "slugify")))
