(loop for i upto 5 do 
	(format t "~A~%" i)
	(format t "~A~%" i)
	(format t "~A~%" i)
	(format t "~A[3A" #\Escape)
	(sleep 1))
(format t "~A[3B" #\Escape)
(quit)
