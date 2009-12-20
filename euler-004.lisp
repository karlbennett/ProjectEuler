;#!/usr/bin/sbcl --noinform

(defun split-number (n)
  "This function takes any number and splits it into two halves then
   returns the halves as two strings. If the number has an even amount
   of digits the two strings will be the left and right side of the whole
   number. If it has odd digits the string will be the left and right side
   of the number minus the middle digit e.g 
   123456 -> '123','456'
   1234567 -> '123','567'"
  (let* ((num (write-to-string n))
	 (lnth (length num))
	 (left (if(evenp lnth) (/ lnth 2) (/ (- lnth 1) 2)))
	 (right (if(evenp lnth) left (1+ left))))
    (list (subseq num 0 left) (subseq num right lnth ))))

(defun palindrom-number-check (n)
  "This function takes a number and checks to see if it is a palindrom.
   It does this by splitting the number using split-number and then
   checking if the left string is equal to the reverse of the right
   string."
  (let* ((spls (split-number n))
	 (l (first spls))
	 (r (second spls)))
    (string= l (reverse r))))

(defun make-max-number (n)
  "This function returns a string of the highest number that can be
   derived within the 'n' number of digits."
  (parse-integer 
	      (make-array n :element-type 'character 
			  :initial-element 
			  (character (write-to-string 9)))))

(defun old-palindrom-multiple-find (n)
  "This funcction finds the highest palindrom number that can be derived
   from the multiplication of any two numbers that are of 'n' digits
   long. It does this by itereating through all the number combinations
   recording any palindrom that is higher than the last one it found. This
   is not very efficient because it doessn't take into account any of the
   combinations it may have already tried."
  (do* ((hp 0)
       (max (make-max-number n))
       (j max (if (= 0 j) (setf j max) (setf j (- j 1))))
       (i max (if (= 0 j) (setf i (- i 1)) i))
       (multi (* i j) (* i j)))
      ((= 0 i) hp)
    (if (and (palindrom-number-check multi) (> multi hp)) (setf hp multi))))



(defun palindrom-multiple-find (n)
  "This funcction finds the highest palindrom number that can be derived
   from the multiplication of any two numbers that are of 'n' digits
   long. It does this by itereating through all the number combinations
   recording any palindrom that is higher than the last one it found. To
   try and minimise any repeat combinations that algorithm first set the
   imbeded iteration to only loop as much as the current index of the outer
   loop. Secondly it stops iteration as soon as the out loops index is lower
   than the inner index record of the highest palindrom."
	   (do* ((hp 0)
		 (hj 0)
		 (hi 0)
		 (max (make-max-number n))
		 (j max (if (= 0 j) (setf j i) (setf j (- j 1))))
		 (i max (if (= 0 j) (setf i (- i 1)) i))
		 (multi (* i j) (* i j)))
		((or (= 0 i) (< i hj)) (list hi hj hp))
	     (if (and (palindrom-number-check multi) (> multi hp))
		 (progn 
		   (setf hp multi)
		   (setf hi i)
		   (setf hj j)))))

(defun new-palindrom-multiple-find (n)
  "Project Euler Answer minus the 11 factor optimisation so the function is more general."
	   (do* ((hp 0)
		 (hi 0)
		 (hj 0)
		 (min (expt 10 (- n 1)))
		 (max (make-max-number n))
		 (j max (if (or (<= j i) (<= multi hp)) (setf j max) (setf j (- j 1))))
		 (i max (if (= j max) (setf i (- i 1)) i))
		 (multi (* i j) (* i j)))
		((<= i min) (list hi hj hp))
	     (if (and (palindrom-number-check multi) (> multi hp)) 
		 (progn 
		   (setf hp multi)
		   (setf hi i)
		   (setf hj j)))))



(print "Find the largest palindrome made from the product of two 3-digit numbers.")
(terpri)
(print (format nil "Split 1234567: ~A" (split-number 123456)))
(terpri)
(print (format nil "Palindrom-Check 1234321: ~A" (palindrom-number-check 1234321)))
(terpri)
(print (format nil "make-max-number 3: ~A" (make-max-number 3)))
(terpri)
(print (format nil "palindrom-multiple-find 3: ~A" (palindrom-multiple-find 3)))
(terpri)
(quit)
