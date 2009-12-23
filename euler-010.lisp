;#!/usr/bin/sbcl --noinform

(load "prime-list.lisp")

(defun euler-010 () (apply '+ (prime-list 2000000)))



(print "Calculate the sum of all the primes below two million.")
(terpri)
(format t "euler-010: ~A~%" (euler-010))
(quit)
