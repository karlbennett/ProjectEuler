#!/usr/bin/sbcl --noinform

(defun prime-array (n) 
	"This first creates an array where each index represents
	all the odd numbers up to 'n' starting at 3 e.g n=6 array=[0]<=>(3),[1]<=>(5)
	The array is filled with 0's and when it is returned evey index that
	represents a prime will have the value 0 as apposed to non-prime indexes
	having the value 1."
	(let* ((primes (make-array (- (/ (if (evenp n) n (1+ n)) 2) 1)))(lnth (length primes)))
                        (dotimes (num lnth)
				(let ((step (+ (* num 2) 3)))
				    (do ((i (+ num step) (+ i step)))
					((> i (- lnth 1)))
				      (setf (aref primes i) 1))))
			primes))

(defun prime-array->list (a)
	"This function takes an array that is generated by prime-array and converts
	it into a list of prime numbers by counting through the array and adding
	every odd number index to it's list."
	(append '(2) (loop for p from 0 below (length a)
				when (= (aref a p) 0)
				collecting (+ (* p 2) 3))))

(defun prime-list (n)
	"This function uses prime-array and prime-array->list to return the list off
	all the prime number under 'n'."
	(prime-array->list (prime-array n)))

(print (format nil "new-prime-list: ~A" (time (prime-list 4000000))))
(terpri)
(quit)
