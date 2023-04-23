(defpackage #:cl-slugify
  (:use #:cl)
  (:export
   #:string-to-slug))

(in-package #:cl-slugify)

(defun dash-non-alphanum-from-string (str)
  (coerce (loop :for k :in (coerce str 'list)
		:collect (if (not (alphanumericp k))
			     #\-
			     k))
	  'string))

(defun should-remove (str char option)
  "Removes the leading dash if first char of STR
is not '-' and OPTION is :remove, or OPTION is :always."
  (or (equal option :always)
      (and (not (char-equal #\- char))
	   (equal option :remove))))

(defun should-remove-leading (str option)
  "Removes the leading dash if first char of STR
is not '-' and OPTION is :remove, or OPTION is :always."
  (should-remove str (aref str 0) option))

(defun should-remove-trailing (str option)
  "Removes the leading dash if first char of STR
is not '-' and OPTION is :remove, or OPTION is :always."
  )


(defun string-to-slug (str &key
			     (leading-dash nil)
			     (trailing-dash nil))
  "Converts STR into a slug string removing accents with unac(3)
with options to deal with LEADING-DASH and TRAILING-DASH.

LEADING-DASH and TRAILING-DASH has 2 options:

:remove - if the string starts with '-', keep it.
:always - remove '-' always."
  (if (equal (length str) 0)
      str
      (let ((remove-leading
	      (should-remove str (aref str 0) leading-dash))
	    (remove-trailing
	      (should-remove str (aref str (1- (length str))) trailing-dash)))
	(let* ((unac-str (cl-unac:unac-string str))
	       (dashed-str (dash-non-alphanum-from-string unac-str)))
	  (let ((a (or (and remove-leading (remove #\- dashed-str :start 0 :count 1))
		       dashed-str)))
	    (or (and remove-trailing (remove #\- a :start 0 :from-end t :count 1))
		a))))))
