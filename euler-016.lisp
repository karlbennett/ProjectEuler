;#!/usr/bin/sbcl --noinform

(defun euler-016 (base power) (apply '+ (map 'list #'digit-char-p (format nil "~A" (expt base power)))))


(print "What is the sum of the digits of the number 2^1000?")
(terpri)
(format t "euler-016: ~A~%" (euler-016 2 1000))
(quit)
