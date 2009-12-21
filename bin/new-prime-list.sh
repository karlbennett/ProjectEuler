cd ../
sbcl --noinform --noprint --load `echo $0 | sed 's/.\///' | sed 's/.sh$//'`.lisp
