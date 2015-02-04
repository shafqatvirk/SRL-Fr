#!/bin/bash
FILES='../frameData/*.*'
declare -i n=0
declare -i t=0
for f in $FILES
 do
      declare -i t=0
      cp $f ../zimplCode/input.txt
      cp ../spanData/span$n.txt ../zimplCode/span.txt
      ../../Software/scipoptsuite-3.1.0/scip-3.1.0/bin/scip -q -f ../zimplCode/srl.zpl -l ../zimplCode/out.txt 
      cp ../zimplCode/out.txt ../output/out$n.txt
      n=$(( n + 1 ))
 done