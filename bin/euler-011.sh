DIRNAME=`dirname $0`
BASENAME=`basename $0`
LISPNAME=`echo $BASENAME | sed 's/.sh$/.lisp/'`
cd $DIRNAME
cd ../
sbcl --script $LISPNAME
