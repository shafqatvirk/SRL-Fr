# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"People","People_by_origin","People_by_origin","Awareness","People_by_origin","Leadership","People"};
set Roles[Frames] :=  <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Awareness"> {"Cognizer","Topic","Degree","Role","Manner","Evidence","Explanation","Time","Content","Expressor","Paradigm"}, <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"};
set Spans := {"-1_-1","0_0","0_2","0_28","10_10","11_11","12_12","13_13","14_14","15_15","16_16","17_17","18_18","19_19","1_1","20_20","20_22","21_21","22_22","23_23","24_24","25_25","25_28","26_26","27_27","28_28","2_2","3_3","4_4","5_5","6_6","6_8","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["People"]] binary;
var z1[Assignment["People_by_origin"]] binary;
var z2[Assignment["People_by_origin"]] binary;
var z3[Assignment["Awareness"]] binary;
var z4[Assignment["People_by_origin"]] binary;
var z5[Assignment["Leadership"]] binary;
var z6[Assignment["People"]] binary;
param probabilities0[Assignment["People"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["People_by_origin"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["People_by_origin"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Awareness"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People_by_origin"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Leadership"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["People"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["People"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["People_by_origin"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["People_by_origin"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Awareness"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People_by_origin"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["People"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 28};
set G[I] := <0> {"0_0","0_2","0_28"}, <1> {"0_2","0_28","1_1"}, <2> {"0_2","0_28","2_2"}, <3> {"0_28","3_3"}, <4> {"0_28","4_4"}, <5> {"0_28","5_5"}, <6> {"0_28","6_6","6_8"}, <7> {"0_28","6_8","7_7"}, <8> {"0_28","6_8","8_8"}, <9> {"0_28","9_9"}, <10> {"0_28","10_10"}, <11> {"0_28","11_11"}, <12> {"0_28","12_12"}, <13> {"0_28","13_13"}, <14> {"0_28","14_14"}, <15> {"0_28","15_15"}, <16> {"0_28","16_16"}, <17> {"0_28","17_17"}, <18> {"0_28","18_18"}, <19> {"0_28","19_19"}, <20> {"0_28","20_20","20_22"}, <21> {"0_28","20_22","21_21"}, <22> {"0_28","20_22","22_22"}, <23> {"0_28","23_23"}, <24> {"0_28","24_24"}, <25> {"0_28","25_25","25_28"}, <26> {"0_28","25_28","26_26"}, <27> {"0_28","25_28","27_27"}, <28> {"0_28","25_28","28_28"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Awareness"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["People"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Awareness"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Leadership"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["People"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Cognizer","Expressor">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
#pairwise requirement constraint