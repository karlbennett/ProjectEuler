;#!/usr/bin/sbcl --noinform

(load "prime-list.lisp")

(print (format nil "new-prime-list: ~A" (time (prime-list 4000000))))
(terpri)
(quit)
