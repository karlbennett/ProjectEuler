;#!/usr/bin/sbcl --noinform

(defun euler-017 (n) 
  (do ((i 1 (1+ i))
       (str "" (concatenate 'string str 
			    (if (or (> 100 i) (= 0 (mod i 100)))
				(format nil "~r" i)
				(format nil "and~r" i)))))
      ((= i (1+ n)) (length (remove-if-not 
			     (lambda (c) 
			       (or 
				(and (char> c #\@) (char< c #\[))
				(and (char> c #\`) (char< c #\{)))) str)))))


(print "How many letters would be needed to write all the numbers in words from 1 to 1000?")
(terpri)
(format t "euler-017: ~A~%" (euler-017 1000))
(quit)
