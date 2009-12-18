(defun prime-list (n) (let ((primes (loop for i from 2 to n collecting i)))
			(dolist (prm primes)
			    (do ((step (+ prm prm) (+ step prm)))
				((> step n))
			      (delete step primes)))
			primes))

(defun max-prime-factor (num &optional primes)
  (let* ((primes (if primes primes (prime-list 1000)))
	 (p (first primes)))
    (if (>= p num)
	p
	(if (> (mod num p) 0)
	    (max-prime-factor num (rest primes))
	    (max-prime-factor (/ num p) primes)))))

(defun euler-003 () (max-prime-factor 600851475143 (prime-list 10000)))



(print (format nil "euler-003: ~A" (euler-003)))
(terpri)
(quit)
