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

(defun find-triplet-for-num (num &optional m n k)
	(let* 		((m (if m m 2))
			 (n (if n n 1))
			 (k (if k k 1))
			 (triplet (pythagorean-triplet  m n k))
			 (sum (apply '+ triplet)))
		(if (or (not triplet) (<= num sum))
			(nconc (list m n k) (nconc triplet (list sum)))
			(progn 
				(format t "~A ~A ~A ~%" (list m n k) triplet sum)
				(find-triplet-for-num num  (1+ m) n (1+ k))))))

(defun find-triplet-for-num1 (num &optional a b c)
	(let* 		((a (if a a 1))
			 (b (if b b 1))
			 (c (if c c (- num 2)))
			 (triplet (list a b c))
			 (sum (+ a b c)))
		(if (or (pythagorean-triplet-check triplet) (< c a) (< c b))
			(nconc triplet (list sum))
			(progn 
				(format t "~A ~A~%" triplet sum)
				(find-triplet-for-num1 num  (1+ a) b (- num (1+ a) b))
				(find-triplet-for-num1 num  a (1+ b) (- num a (1+ b)))))))

(defun euler-009 () (find-triplet-for-num1 1000))


(format t "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,~%a^(2) + b^(2) = c^(2)~%~%For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).~%~%There exists exactly one Pythagorean triplet for which a + b + c = 1000.~%Find the product abc.~%~%")
(format t "pythagorean-triplet: ~A~%" (pythagorean-triplet 2 1 1))
(format t "euler-009: ~A~%" (euler-009))
(format t "pythagorean-triplet-check: ~A~%" (pythagorean-triplet-check '(1 2 3)))
(quit)
