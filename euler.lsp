(defun euler-001 () (loop for x from 1 below 1000 when (or (= (mod x 3) 0) (= (mod x 5) 0)) sum x))
