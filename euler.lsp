(defun euler-001 () (loop for x from 1 to 999 when (or (= (mod x 3) 0) (= (mod x 5) 0)) sum x))
