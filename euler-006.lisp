#!/usr/bin/sbcl --noinform

(defun euler-006 (num)
  "This function find the value of
   (1 + 2 + 3 ... num)^2 - (1^2 + 2^2 + 3^2... + num^2)"
  (- (expt (loop for i from 1 upto num summing i) 2) 
     (loop for i from 1 upto num summing (expt i 2))))

(print (format nil "euler-006: ~A" (euler-006 100)))
(terpri)
(quit)
