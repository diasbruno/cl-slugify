(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)
(push *default-pathname-defaults* ql:*local-project-directories*)

(quicklisp:quickload :cl-unac.config)

(cl-unac.config:load-from-custom-path "/usr/lib/x86_64-linux-gnu/libunac")

(quicklisp:quickload :cl-slugify.tests)

(setq fiveam:*on-error* :debug)

(in-package #:cl-user)

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore c h))
        (uiop:quit -1)))

(unless (fiveam:run-all-tests)
  (exit :code 1 :abort t))
