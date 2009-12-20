;#!/usr/bin/sbcl --noinform

(load "prime-list.lisp")

(defun prime-factors (num &optional primes)
	"This function takes a number and then a list of prime numbers which it
	then uses to find all the factors of the given number. If a list of primes
	is not given the function will use the prime-list function to work out all
	the primes before 1000 and use them."
	; Take a the given list of primes if it exists else take all the primes upto 1000...
	  (let* ((primes (if primes primes (prime-list 1000)))
		 (p (first primes))) ; ...then take the first prime in the list...
	    (if (>= p num) ; ...if the prime is equal or larger than the given number...
		(list p) ; ...return a list contaning the first prime.
		; ...else if the given number is not divisable by the first prime...
		(if (> (mod num p) 0)
		    (prime-factors num (rest primes)) ; ...try the next prime.
		    ; ...else if it is divisable by the first prime find the prime
		    ; factor of the given number devided by the first prime. Then
		    ; return the a list ccontsain the first prime and the next prime
		    ; factor.
		    (nconc (list p) (prime-factors (/ num p) primes))))))

(defun euler-003 () (prime-factors 600851475143 (prime-list 10000)))



(print "Find the largest prime factor of a composite number.")
(terpri)
(print (format nil "euler-003: ~A" (euler-003)))
(terpri)
(quit)
