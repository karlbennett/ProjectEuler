(defun split-number (n)
	(let* ((num (write-to-string n))
			(lnth (length num))
			(left (if(evenp lnth) (/ lnth 2) (/ (- lnth 1) 2)))
			(right (if(evenp lnth) left (1+ left))))
		(list (subseq num 0 left) (subseq num right lnth ))))

(defun palindrom-check (l r)
	(string= l (reverse r)))



(print (split-number 123456))
(terpri)
(print (let ((spls (split-number 123456))) (palindrom-check 
(terpri)
(print (split-number 1234567))
(terpri)
(quit)
