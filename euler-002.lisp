;#!/usr/bin/sbcl --noinform

(defun euler-002 () (do ((sum 0)
			 (cur 1 next)
			 (next 2 (+ cur next))) 
			((< 4000000 cur) sum) 
		      (when (evenp cur)
			(setf sum (+ sum cur)))))


(print "Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.")
(terpri)
(format t "euler-002: ~A~%" (euler-002))
(quit)
