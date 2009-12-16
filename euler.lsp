(defun euler-001 () (loop for x from 1 below 1000 
		       when (or (= (mod x 3) 0) (= (mod x 5) 0)) 
		       sum x))



(defun euler-002 () (do ((sum 0)
			 (cur 1 next)
			 (next 2 (+ cur next))) 
			((< 4000000 cur) sum) 
		      (when (evenp cur)
			(setf sum (+ sum cur)))))



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
