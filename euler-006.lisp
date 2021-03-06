;#!/usr/bin/sbcl --noinform

(defun euler-006 (num)
  "This function find the value of
   (1 + 2 + 3 ... num)^2 - (1^2 + 2^2 + 3^2... + num^2)"
  (- (expt (loop for i from 1 upto num summing i) 2) 
     (loop for i from 1 upto num summing (expt i 2))))

(print "What is the difference between the sum of the squares and the square of the sums?")
(terpri)
(format t "euler-006: ~A~%" (euler-006 100))
(quit)
