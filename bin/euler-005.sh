cd ../
sbcl --script `echo $0 | sed 's/.\///' | sed 's/.sh$//'`.lisp
