# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Motion","Direction","Cardinal_numbers","Architectural_part","Intentionally_act","Operate_vehicle","Being_named","Roadways","Increment","Locale_by_use"};
set Roles[Frames] :=  <"Motion"> {"Speed","Duration","Area","Theme","Distance","Depictive","Manner","Result","Direction","Time","Source","Containing_event","Place","Goal","Purpose","Path","Carrier","Path_shape"}, <"Direction"> {"Base_position","Independent_variable","Degree","Path"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Architectural_part"> {"Part","Whole","Descriptor","Material","Orientation"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Operate_vehicle"> {"Speed","Area","Cotheme","Distance","Depictive","Circumstances","Manner","Explanation","Vehicle","Time","Source","Place","Frequency","Goal","Particular_iteration","Path","Driver","Event"}, <"Being_named"> {"Name","Speaker","Type","Name_source","Entity"}, <"Roadways"> {"Characteristic","Length","Use","Frequency_of_use","Goal","Relative_location","Endpoints","Direction","Source","Material","Path","Roadway","Name","Abundant_entities"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_22","10_10","10_11","10_14","11_11","11_14","12_12","12_14","13_13","13_14","14_14","15_15","16_16","16_21","17_17","17_18","17_21","18_18","19_19","1_1","20_20","21_21","22_22","2_2","3_3","4_4","4_5","5_5","6_21","6_6","7_21","7_7","8_15","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Motion"]] binary;
var z1[Assignment["Direction"]] binary;
var z2[Assignment["Cardinal_numbers"]] binary;
var z3[Assignment["Architectural_part"]] binary;
var z4[Assignment["Intentionally_act"]] binary;
var z5[Assignment["Operate_vehicle"]] binary;
var z6[Assignment["Being_named"]] binary;
var z7[Assignment["Roadways"]] binary;
var z8[Assignment["Increment"]] binary;
var z9[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Motion"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Direction"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Cardinal_numbers"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Architectural_part"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Intentionally_act"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Operate_vehicle"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Being_named"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Roadways"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Increment"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Locale_by_use"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Motion"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Direction"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Architectural_part"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Operate_vehicle"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Being_named"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Roadways"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 22};
set G[I] := <0> {"0_0","0_22"}, <1> {"0_22","1_1"}, <2> {"0_22","2_2"}, <3> {"0_22","3_3"}, <4> {"0_22","4_4","4_5"}, <5> {"0_22","4_5","5_5"}, <6> {"0_22","6_21","6_6"}, <7> {"0_22","6_21","7_21","7_7"}, <8> {"0_22","6_21","7_21","8_15","8_8"}, <9> {"0_22","6_21","7_21","8_15","9_9"}, <10> {"0_22","10_10","10_11","10_14","6_21","7_21","8_15"}, <11> {"0_22","10_11","10_14","11_11","11_14","6_21","7_21","8_15"}, <12> {"0_22","10_14","11_14","12_12","12_14","6_21","7_21","8_15"}, <13> {"0_22","10_14","11_14","12_14","13_13","13_14","6_21","7_21","8_15"}, <14> {"0_22","10_14","11_14","12_14","13_14","14_14","6_21","7_21","8_15"}, <15> {"0_22","15_15","6_21","7_21","8_15"}, <16> {"0_22","16_16","16_21","6_21","7_21"}, <17> {"0_22","16_21","17_17","17_18","17_21","6_21","7_21"}, <18> {"0_22","16_21","17_18","17_21","18_18","6_21","7_21"}, <19> {"0_22","16_21","17_21","19_19","6_21","7_21"}, <20> {"0_22","16_21","17_21","20_20","6_21","7_21"}, <21> {"0_22","16_21","17_21","21_21","6_21","7_21"}, <22> {"0_22","22_22"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Motion"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Direction"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Architectural_part"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Operate_vehicle"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Being_named"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Roadways"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Motion"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Direction"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Architectural_part"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Operate_vehicle"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Being_named"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Roadways"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Increment"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Area","Direction">,<"Area","Distance">,<"Area","Goal">,<"Area","Path">,<"Area","Source">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc5 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
#pairwise requirement constraint