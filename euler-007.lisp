;#!/usr/bin/sbcl --noinform

(load "prime-list.lisp")

; From a previous try I know that the 10001st prime is less than 105000.
(defun euler-007 () (nth 10000 (prime-list 105000)))



(print "Find the 10001st prime.")
(terpri)
(format t "euler-007: ~A~%" (euler-007))
(quit)
