(defun nth-level (tree n)
  (remove nil
	  (if (< 0 n)
	      (nconc (nth-level (second tree) (- n 1))
		     (nth-level (third tree) (- n 1)))
	      (list tree))))

(defun first-half (lst)
  (let* ((lnth (length lst)) (half-lnth (if (evenp lnth) (/ lnth 2) (/ (1+ lnth) 2))))
    (subseq lst 0 half-lnth)))

(defun second-half (lst)
  (let* ((lnth (length lst)) (half-lnth (if (evenp lnth) (/ lnth 2) (/ (1+ lnth) 2))))
    (subseq lst half-lnth)))

(defun filter-list (lst n)
      (loop for i from n upto (length lst)
	 and j = i then (+ i j)
	 for element = (nth (- j 1) lst)
	 for new-lst = (remove-if (lambda (e) (eq e element)) lst)
	 then (remove-if (lambda (e) (eq e element)) new-lst)
	 finally (return new-lst)))
  
(defun make-tree (lst)
  (let ((head (first lst)) 
	(fh (remove nil (nthcdr 1 (filter-list lst 3))))
	(sh (remove nil (nthcdr 1 (filter-list lst 2)))))
    (cond
      ((and (< 0 (length fh)) (< 0 (length sh)))
       (list head (make-tree fh) (make-tree sh)))
      ((< 0 (length fh))
       (list head (make-tree fh)))
      (t (list head)))))

(defun draw-tree (tree)
  (do* ((i 0 (1+ i))
		 (line 
		  (remove-duplicates 
		   (loop for e in (nth-level tree i) collect (first e)))
		  (remove-duplicates 
		   (loop for e in (nth-level tree i) collect (first e)))))
		((equalp line nil))
	     (format t "~A~%" line)))

(defun walk-tree (tree)
	(if (< 1 (length tree))
		(list (first tree) (if (> (first (second tree)) (first (third tree)))
					(walk-tree (second tree))
					(walk-tree (third tree))))
		tree))
				

(let ((tree (make-tree '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))))
	(draw-tree tree)
	(format t "~A" (walk-tree tree)))
(quit)
