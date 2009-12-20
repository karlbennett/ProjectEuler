#!/usr/bin/sbcl --noinform

(defun old-prime-list (n)
        "This function builds a list of odd numbers up to n and then works it's
        way through the list removing an multiples of each number it encounters
        starting at 3.
        This seemed like a good idea when I first implemented it but it turns
        out that it is VERY slow."
        (let ((primes (loop for i from 3 to n by 2 collecting i)))
                        (dolist (prm primes)
                            (do ((step (+ prm (* prm 2)) (+ step (* prm 2))))
                                ((> step n))
                              (delete step primes)))
                        (append '(2) primes)))

(print (format nil "old-prime-list: ~A" (old-prime-list 1000)))
(terpri)
(quit)
