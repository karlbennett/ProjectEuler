;#!/usr/bin/sbcl --noinform

(defun split-string (str d)
  "This function can be used to split a string with any given delimiter."
  (loop for i = 0 then (1+ j) ; Start at index zero then move to... 
     as j = (position d str :start i) ; ...index j which is the index of the first delimiter.
     collect (subseq str i j) while j)) ; Collect all the characters in between the indexes
					; as separate string as we go.

(defun file->2darray (f)
  "This function can be used to create a 2d list of strings. Where each internal list is
   made up of all the numbers within each line."
  (with-open-file (in f :element-type 'character) ; Open the given file and set 'in' as input.
    (loop for line = (read-line in nil) ; For every line in the file...
       while line ; ...while there are still lines left...
       collecting ; ...collect each list that is returned...
	 (map 'list #'parse-integer ; ...after each element is parsed to an int within...
	      (split-string line #\Space))))) ; ...the list that is made by splitting the line
					; with spaces.

(defun highest-four (lst)
  "This function can be used to find the highest group of four numbers within any list of
   numbers."
  (loop for d on lst ; Loop decreasing the passed in list by one element at a time taking...
     for four = (if (>= (length d) 4) (subseq d 0 4) four) ; ...the first four elements and...
     ; ...if the product of these elements is higher than any of the last sets of four...
     for max-four = (if (> (apply '* four) (apply '* max-four))
			four ; ...set max-four to be the new list of four elements...
			max-four) ; ...else don't change max-four.
     finally (return max-four))) ; When the loop has finished return the list in max-four.

(defun get-verticals (2dlist)
  "This function can be used to create a 2d list that is made up of the columns of the given
   2d list." 
  (let ((rows (length 2dlist))) ; Find the number of rows in the given 2d list.
    (loop for i upto (- rows 1) ; Then for every row in the list...
	 collecting ; ...collect a list made up of every ith element. 
	 (map 'list (lambda (e) (nth i e)) 2dlist))))

(defun get-diagonals (2dlist)
  "This function can be used to make up a 2d list of all the top to bottom left to righ
   diagonals within the given 2d list."
  (let ((lnth (length 2dlist))) 
    (remove nil ; Before returning the list clear out any nil values.
	    ; Loop from minus the 2d lists length up to it's length to catch all possible
	    ; diagonals...
	    (loop for i from (- 0 lnth) upto (- lnth 1)
	       collecting ; ...collecting all the diagonal lists.
		 (remove nil ; Remove any nil values from the resultant list.
			 (map 'list (let ((j i)) ; Map through the 2d list...
				      (lambda (e) ; ...taking from each inner list...
					; ...the element at an ever incrementing index.
					(when (>= (setf j (1+ j)) 0)
					  (nth j e))))
			      2dlist))))))

(defun find-highest-four (2dlist)
  "This function can be used to find the highest group of four multiples from a list of lists."
  (loop for line in 2dlist ; For each list...
       for four = (highest-four line) ; ...find the highest group of four multiples...
       ; ...then store the ever highest multiples in max-four.
       for max-four = (if (> (apply '* four) (apply '* max-four)) four max-four)
       finally (return max-four))) ; At the end of the loop return max-four.
		       



(defun euler-011 ()
  (let* ((numarray (file->2darray "data/euler-011.txt"))
	 (highest-h (find-highest-four numarray)) ; Find the highest horizontal group of four.
	 (highest-v (find-highest-four (get-verticals numarray))) ; Then the highest vertical.
	 (highest-d1 (find-highest-four (get-diagonals numarray))) ; And diagonals.
	 (highest-d2 (find-highest-four (get-diagonals (reverse numarray))))
	 (highest-four (find-highest-four (list highest-h highest-v highest-d1 highest-d2)))
	 (highest-product (apply '* highest-four))) ; Finally find the highest total.
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
