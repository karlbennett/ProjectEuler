;#!/usr/bin/sbcl --noinform


(defun file->string (f)
  (with-open-file (in f :element-type 'character)
    (let ((digits (make-array (file-length in) :element-type 'character)))
      (read-sequence digits in)
      (close in)
      (loop for d across digits
	 when (and (char< #\/ d) (char> #\: d) ) 
	 collect (parse-integer (string d))))))

(defun euler-008 () ())


(print "Discover the largest product of five consecutive digits in the 1000-digit number.")
(terpri)
(format t "euler-008: ~A~%" (euler-008))
(quit)
