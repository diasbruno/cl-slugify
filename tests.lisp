(defpackage #:cl-slugify.tests
  (:use #:cl #:fiveam #:cl-slugify))

(in-package #:cl-slugify.tests)

(5am:def-suite cl-slugify-suite)

(5am:in-suite cl-slugify-suite)

(5am:def-test string-with-only-spaces ()
  (5am:is (equal (cl-slugify:string-to-slug "a b c")
		 "a-b-c")))

(5am:def-test string-with-non-alphanum-chars ()
  (5am:is (equal (cl-slugify:string-to-slug "a b c !")
		 "a-b-c--")))

(5am:def-test string-with-only-alphanum ()
  (5am:is (equal (cl-slugify:string-to-slug "abc1234")
		 "abc1234")))

(5am:def-test if-string-starts-with-dash-dont-remove ()
  (5am:is (equal (cl-slugify:string-to-slug "-abc1234")
		 "-abc1234")))

(5am:def-test dont-remove-leading-dash-with-string-starts-with-dash ()
  (5am:is (equal (cl-slugify:string-to-slug "-abc1234")
		 "-abc1234")))

(5am:def-test dont-remove-leading-dash-with-string-starts-with-dash-even-with-option-remove ()
  (5am:is (equal (cl-slugify:string-to-slug "-abc1234" :leading-dash :remove)
		 "-abc1234")))

(5am:def-test always-remove-leading-dash ()
  (5am:is (equal (cl-slugify:string-to-slug "-abc1234" :leading-dash :always)
		 "abc1234")))

(5am:def-test if-string-ends-with-dash-dont-remove ()
  (5am:is (equal (cl-slugify:string-to-slug "abc1234-")
		 "abc1234-")))

(5am:def-test dont-remove-trailing-dash-with-string-end-with-dash-even-with-option-remove ()
  (5am:is (equal (cl-slugify:string-to-slug "abc1234-" :trailing-dash :remove)
		 "abc1234-")))

(5am:def-test always-remove-trailing-dash ()
  (5am:is (equal (cl-slugify:string-to-slug "abc1234-" :trailing-dash :always)
		 "abc1234")))

(5am:def-test dont-remove-middle-dash-when-removing-trailing-and-leading-dash ()
  (5am:is (equal (cl-slugify:string-to-slug "-abc 12 34-" :leading-dash :always :trailing-dash :always)
		 "abc-12-34")))
