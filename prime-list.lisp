(defun prime-list (n) (let ((primes (loop for i from 3 to n by 2 collecting i)))
			(dolist (prm primes)
			    (do ((step (+ prm (* prm 2)) (+ step (* prm 2))))
				((> step n))
			      (delete step primes)))
			(append '(2) primes)))


(print (format nil "prime-list: ~A" (prime-list 1000)))
(terpri)
(quit)
