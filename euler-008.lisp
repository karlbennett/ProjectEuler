;#!/usr/bin/sbcl --noinform


(defun file->list (f)
  (with-open-file (in f :element-type 'character)
    (let ((digits (make-array (file-length in) :element-type 'character)))
      (read-sequence digits in)
      (close in)
      (loop for d across digits
	 when (and (char< #\/ d) (char> #\: d) ) 
	 collect (parse-integer (string d))))))

(defun highest-five (lst)
	(let ((hone 0) (htwo 0) (hthree 0) (hfour 0) (hfive 0) (hmult 0))
		(loop for i upto (- (length lst) 5)
			for j = (1+ i) then k
			for k = (1+ j) then l
			for l = (1+ k) then m
			for m = (1+ l) then (1+ l)
			for lone = (nth i lst) then (nth i lst)
			for ltwo = (nth j lst) then (nth j lst)
			for lthree = (nth k lst) then (nth k lst)
			for lfour = (nth l lst) then (nth l lst)
			for lfive = (nth m lst) then (nth m lst)
			for lmult = (* lone ltwo lthree lfour lfive) then (* lone ltwo lthree lfour lfive)
			when (> lmult hmult)
			do (format t "(* ~A ~A ~A ~A ~A) = ~A~%"
				(setf hone lone)
				(setf htwo ltwo)
				(setf hthree lthree)
				(setf hfour lfour)
				(setf hfive lfive)
				(setf hmult lmult)))
		(list (list hone htwo hthree hfour hfive) hmult)))

(defun euler-008 () (highest-five (file->list "data/numbers.txt")))


(print "Discover the largest product of five consecutive digits in the 1000-digit number.")
(terpri)
(format t "euler-008: ~A~%" (euler-008))
(quit)
