# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Obviousness","Possession","Artifact","Usefulness","Manufacturing","Locale_by_use","Part_whole"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Obviousness"> {"Attribute","Perceiver","Phenomenon","Degree","Time","Evidence","Particular_iteration","Direction","Location_of_protagonist"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Usefulness"> {"Purpose","Domain","Time","Degree","Entity"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Part_whole"> {"Part","Whole","Part_Prop","Orientation"};
set Spans := {"-1_-1","0_0","0_24","10_10","11_11","12_12","13_13","14_14","14_23","15_15","15_23","16_16","16_23","17_17","17_23","18_18","19_19","1_1","20_20","20_22","21_21","21_22","22_22","23_23","24_24","2_2","3_3","4_4","5_10","5_13","5_23","5_5","6_10","6_6","7_10","7_7","8_10","8_8","9_10","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Obviousness"]] binary;
var z2[Assignment["Possession"]] binary;
var z3[Assignment["Artifact"]] binary;
var z4[Assignment["Usefulness"]] binary;
var z5[Assignment["Manufacturing"]] binary;
var z6[Assignment["Locale_by_use"]] binary;
var z7[Assignment["Part_whole"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Obviousness"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Possession"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Artifact"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Usefulness"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Manufacturing"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Locale_by_use"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Part_whole"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Obviousness"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Usefulness"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Part_whole"] : probabilities7[r,s] * z7[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 24};
set G[I] := <0> {"0_0","0_24"}, <1> {"0_24","1_1"}, <2> {"0_24","2_2"}, <3> {"0_24","3_3"}, <4> {"0_24","4_4"}, <5> {"0_24","5_10","5_13","5_23","5_5"}, <6> {"0_24","5_10","5_13","5_23","6_10","6_6"}, <7> {"0_24","5_10","5_13","5_23","6_10","7_10","7_7"}, <8> {"0_24","5_10","5_13","5_23","6_10","7_10","8_10","8_8"}, <9> {"0_24","5_10","5_13","5_23","6_10","7_10","8_10","9_10","9_9"}, <10> {"0_24","10_10","5_10","5_13","5_23","6_10","7_10","8_10","9_10"}, <11> {"0_24","11_11","5_13","5_23"}, <12> {"0_24","12_12","5_13","5_23"}, <13> {"0_24","13_13","5_13","5_23"}, <14> {"0_24","14_14","14_23","5_23"}, <15> {"0_24","14_23","15_15","15_23","5_23"}, <16> {"0_24","14_23","15_23","16_16","16_23","5_23"}, <17> {"0_24","14_23","15_23","16_23","17_17","17_23","5_23"}, <18> {"0_24","14_23","15_23","16_23","17_23","18_18","5_23"}, <19> {"0_24","14_23","15_23","16_23","17_23","19_19","5_23"}, <20> {"0_24","14_23","15_23","16_23","17_23","20_20","20_22","5_23"}, <21> {"0_24","14_23","15_23","16_23","17_23","20_22","21_21","21_22","5_23"}, <22> {"0_24","14_23","15_23","16_23","17_23","20_22","21_22","22_22","5_23"}, <23> {"0_24","14_23","15_23","16_23","17_23","23_23","5_23"}, <24> {"0_24","24_24"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Obviousness"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Usefulness"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Part_whole"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Obviousness"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Possession"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Artifact"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Usefulness"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Part_whole"] do sum <s> in Spans : z7[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
