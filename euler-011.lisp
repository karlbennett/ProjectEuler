;#!/usr/bin/sbcl --noinform

(defun split-string (str d)
  (loop for i = 0 then (1+ j) as j = (position d str :start i) collect (subseq str i j) while j))

(defun file->2darray (f)
  (with-open-file (in f :element-type 'character)
    (loop for line = (read-line in nil) while line collecting (map 'list #'parse-integer (split-string line #\Space)))))

(defun highest-four (lst)
  (loop for d on lst
     for four = (if (>= (length d) 4) (subseq d 0 4) four)
     for max-four = (if (> (apply '* four) (apply '* max-four)) four max-four)
     finally (return max-four)))

(defun get-verticals (2dlist)
  (let ((lnth (length 2dlist)))
    (loop for i upto (- lnth 1)
	 collecting (map 'list (lambda (e) (nth i e)) 2dlist))))

(defun get-diagonals (2dlist)
  (let ((lnth (length 2dlist))) 
    (remove nil 
	    (loop for i from (- 0 lnth) upto (- lnth 1)
	       collecting (remove nil 
				  (map 'list (let ((j i))
					       (lambda (e)
						 (when (>= (setf j (1+ j)) 0)
						   (nth j e))))
				       2dlist))))))

(defun find-highest-four (2dlist)
  (loop for line in 2dlist
       for four = (highest-four line)
       for max-four = (if (> (apply '* four) (apply '* max-four)) four max-four)
       finally (return max-four)))
		       



(defun euler-011 ()
  (let* ((numarray (file->2darray "data/euler-011.txt"))
	 (highest-h (find-highest-four numarray))
	 (highest-v (find-highest-four (get-verticals numarray)))
	 (highest-d1 (find-highest-four (get-diagonals numarray)))
	 (highest-d2 (find-highest-four (get-diagonals (reverse numarray))))
	 (highest-four (find-highest-four (list highest-h highest-v highest-d1 highest-d2)))
	 (highest-product (apply '* highest-four)))
    (format t "Highest Horizontal: ~A = ~A~%" highest-h (apply '* highest-h))
    (format t "Highest Vertical: ~A = ~A~%" highest-v (apply '* highest-v))
    (format t "Highest Diagonal1: ~A = ~A~%" highest-d1 (apply '* highest-d1))
    (format t "Highest Diagonal2: ~A = ~A~%" highest-d2 (apply '* highest-d2))
    (format t "Highest Total: ~A = ~A~%" highest-four highest-product)
    (list highest-four highest-product)))   
		     


(print "Discover the largest product of five consecutive digits in the 1000-digit number.")
(terpri)
(format t "euler-011: ~A~%" (euler-011))
(quit)
