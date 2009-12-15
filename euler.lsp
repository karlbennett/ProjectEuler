(defun euler-001 () (loop for x from 1 below 1000 when (or (= (mod x 3) 0) (= (mod x 5) 0)) sum x))

(defun euler-2 () (do ((sum 0)(cur 1 next)(next 2 (+ cur next))) ((< 4000000 cur) sum) (when (evenp cur)(setf sum (+ sum cur)))))