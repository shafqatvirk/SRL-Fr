# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Time_vector","Arriving","Natural_features","Intentionally_create","Colonization","Natural_features","Part_orientational","Part_whole","Natural_features"};
set Roles[Frames] :=  <"Time_vector"> {"Distance","Event","Landmark_event","Direction"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Intentionally_create"> {"Created_entity","Place","Role","Manner","Components","Creator","Time","Means","Purpose","Co_participant"}, <"Colonization"> {"Explanation","Time","New_area","Homeland","Descriptor","Colonists","Purpose"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Part_whole"> {"Part","Whole","Part_Prop","Orientation"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_20","10_10","10_11","10_19","11_11","12_12","12_19","13_13","13_15","13_19","14_14","15_15","16_16","16_19","17_17","17_19","18_18","19_19","1_1","20_20","2_2","3_3","3_4","4_4","5_5","6_6","7_19","7_7","8_19","8_8","9_19","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Time_vector"]] binary;
var z1[Assignment["Arriving"]] binary;
var z2[Assignment["Natural_features"]] binary;
var z3[Assignment["Intentionally_create"]] binary;
var z4[Assignment["Colonization"]] binary;
var z5[Assignment["Natural_features"]] binary;
var z6[Assignment["Part_orientational"]] binary;
var z7[Assignment["Part_whole"]] binary;
var z8[Assignment["Natural_features"]] binary;
param probabilities0[Assignment["Time_vector"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Arriving"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Natural_features"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Intentionally_create"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Colonization"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Natural_features"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Part_orientational"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Part_whole"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Natural_features"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Time_vector"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Intentionally_create"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Colonization"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Part_whole"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 20};
set G[I] := <0> {"0_0","0_20"}, <1> {"0_20","1_1"}, <2> {"0_20","2_2"}, <3> {"0_20","3_3","3_4"}, <4> {"0_20","3_4","4_4"}, <5> {"0_20","5_5"}, <6> {"0_20","6_6"}, <7> {"0_20","7_19","7_7"}, <8> {"0_20","7_19","8_19","8_8"}, <9> {"0_20","7_19","8_19","9_19","9_9"}, <10> {"0_20","10_10","10_11","10_19","7_19","8_19","9_19"}, <11> {"0_20","10_11","10_19","11_11","7_19","8_19","9_19"}, <12> {"0_20","10_19","12_12","12_19","7_19","8_19","9_19"}, <13> {"0_20","10_19","12_19","13_13","13_15","13_19","7_19","8_19","9_19"}, <14> {"0_20","10_19","12_19","13_15","13_19","14_14","7_19","8_19","9_19"}, <15> {"0_20","10_19","12_19","13_15","13_19","15_15","7_19","8_19","9_19"}, <16> {"0_20","10_19","12_19","13_19","16_16","16_19","7_19","8_19","9_19"}, <17> {"0_20","10_19","12_19","13_19","16_19","17_17","17_19","7_19","8_19","9_19"}, <18> {"0_20","10_19","12_19","13_19","16_19","17_19","18_18","7_19","8_19","9_19"}, <19> {"0_20","10_19","12_19","13_19","16_19","17_19","19_19","7_19","8_19","9_19"}, <20> {"0_20","20_20"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Time_vector"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Intentionally_create"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Colonization"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Part_whole"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Time_vector"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Arriving"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Intentionally_create"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Colonization"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Part_whole"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint