;#!/usr/bin/sbcl --noinform

(defun pythagorean-triplet (m n k)
	"Generate a pythagorean triplet using Euclid's formula:
		a = k.(m^2 - n^2) : b = k.(2mn) : c = k.(m^2 + n^2)
		where m, n, and k are positive integers with m > n."
	(when (> m n)
		(list (* k (- (expt m 2) (expt n 2))) (* k (* 2 m n)) (* k (+ (expt m 2) (expt n 2))))))

(defun pythagorean-triplet-check (triplet)
	(when (= (+ (expt (first triplet) 2) (expt (second triplet) 2)) (expt (third triplet) 2))
		triplet))

(defun triplet-multiple-test (triplet n)
	(format t "(+ ~A ~A ~A) = ~A n = ~A~%~%"
		(first triplet) (second triplet) (third triplet)
		(+ (first triplet) (second triplet) (third triplet))
		n)
	(= (+ (first triplet) (second triplet) (third triplet)) n))

(defun find-triplet-for-num (num)
	(do* 	((sum 0 (apply '+ triplet))
			(n 1 (if (> sum num) (1+ n) n))
			(m 2 (if (> sum num) (1+ n) (1+ m))))
			(k 1 (
			(triplet nil (pythagorean-triplet m n k)))
		((= sum num) triplet)
		(

(defun euler-009 () (triplet-multiple-test (pythagorean-triplet-check (pythagorean-triplet 20 19 1)) 1000))


(format t "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,~%a^(2) + b^(2) = c^(2)~%~%For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).~%~%There exists exactly one Pythagorean triplet for which a + b + c = 1000.~%Find the product abc.~%~%")
(format t "euler-009: ~A~%" (euler-009))
(format t "pythagorean-triplet-check: ~A~%" (pythagorean-triplet-check '(1 2 3)))
(quit)
