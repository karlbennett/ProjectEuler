;#!/usr/bin/sbcl --noinform

(defun iterative-sequince (num)
  (do ((i (if (evenp num) (/ num 2) (+ 1 (* num 3))) (if (evenp i) (/ i 2) (+ 1 (* i 3))))
       (nums (list num) (append nums (list i))))
      ((= 1 i) (append nums (list 1)))))

(defun find-max-sequence (num) 
  (loop for i from 1 upto num
     for nums  = (iterative-sequince i)
     for max-nums = (if (> (length nums) (length (first max-nums)))
			(list nums i)
			max-nums)
     finally (return max-nums)))

(defun euler-014 () "euler-014")


(print "Find the longest sequence using a starting number under one million.")
(terpri)
(format t "euler-014: ~A~%" (euler-014))
(quit)
