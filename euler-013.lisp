;#!/usr/bin/sbcl --noinform

(defun file->sum (f)
  "This function can be used to sum all the numbers within a file that contains number
   separated by new lines."
  (with-open-file (in f :element-type 'character)
    (loop for line = (read-line in nil) ; Read in every line of the file...
       while line ; ...while there are still lines within the file...
       summing (parse-integer line)))) ; ...sum all the numbers on each line.

(defun euler-013 () (let* ((num (file->sum "data/euler-013.txt")) ; Take the final sum and...
			   ; ...get its first ten digits.
			   (first-10 (subseq (format nil "~A" num) 0 10)))
		      (list num first-10)))


(print "Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.")
(terpri)
; Thank you Lisp and your brilliant number handling :)
(format t "euler-013: ~A~%" (euler-013))
(quit)
