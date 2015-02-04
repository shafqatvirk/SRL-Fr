#!/bin/bash
FILES='../sentData/*.*'
declare -i n=0
declare -i t=0
for f in $FILES
 do
      declare -i t=0
      fname=`basename $f`
      python build-model-input.py $f
      python generate-zimpl-program.py $f
      ../../Software/scipoptsuite-3.1.0/scip-3.1.0/bin/scip -q -f ../zimplCode/srl$fname.zpl -l ../output/out$fname.txt 
      #cp ../zimplCode/out.txt ../output/out$n.txt
      n=$(( n + 1 ))
 done