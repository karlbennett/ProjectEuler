;#!/usr/bin/sbcl --noinform

(defun euler-005 ()
  "This function fonds the first intiger that is divisable by
   all the numbeers up to 20. It is very broot force so very    
   slow."
  (do ((num 1 (setf num (1+ num))))
	     ((and (= (mod num 1) 0)
		   (= (mod num 2) 0)
		   (= (mod num 3) 0)
		   (= (mod num 4) 0)
		   (= (mod num 5) 0)
		   (= (mod num 6) 0)
		   (= (mod num 7) 0)
		   (= (mod num 8) 0)
		   (= (mod num 9) 0)
		   (= (mod num 10) 0)
		   (= (mod num 11) 0)
		   (= (mod num 12) 0)
		   (= (mod num 13) 0)
		   (= (mod num 14) 0)
		   (= (mod num 15) 0)
		   (= (mod num 16) 0)
		   (= (mod num 17) 0)
		   (= (mod num 18) 0)
		   (= (mod num 19) 0)
		   (= (mod num 20) 0)) num)))

(print "What is the smallest number divisible by each of the numbers 1 to 20?")
(terpri)
(format t "euler-005: ~A~%" (euler-005))
(quit)
