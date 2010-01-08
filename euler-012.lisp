;#!/usr/bin/sbcl --noinform

(defun find-divisors (num)
  "This function can be used to find the all the divisors o any given number."
  (let* ((init-devs ; Find all the divisors up to the numbers square root.
	  (loop for i from 1 to (sqrt num) when (= 0 (mod num i)) collecting i))
	 (extra-devs ; Then take these divisors and and use them to find the rest.
	  (loop for n in init-devs collecting (/ num n))))
    ; Then return the two lists appended together.
    (remove-duplicates (append init-devs (reverse extra-devs)))))

(defun find-triangle-number (num)
  "This function finds the trianlge number of any given number."
  (loop for n from 1 to num summing n))

(defun euler-012 () (do* ((n 1 (1+ n)) ; Loop from 1 to infinity...
			  ; ...finding the triangle number of each itteration...
			  (tri-num (find-triangle-number n) (find-triangle-number n))
			  ; ...find the number of divisors for each triangle number...
			  (divisors (find-divisors tri-num) (find-divisors tri-num)))
			 ; ...then return when the number of divisors reaches 500.
			 ((>= (length divisors) 500) (list divisors n))))

(print "What is the value of the first triangle number to have over five hundred divisors?")
(terpri)
(format t "euler-012: ~A~%" (euler-012))
(quit)
