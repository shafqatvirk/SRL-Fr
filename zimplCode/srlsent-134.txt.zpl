# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Leadership","Statement","Telling","Weapon","Substance","Capability","Sole_instance","Arriving","Cardinal_numbers","Political_locales"};
set Roles[Frames] :=  <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Telling"> {"Iteration","Topic","Time","Descriptor","Place","Addressee","Epistemic_stance","Manner","Means","Message","Speaker","Medium"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Sole_instance"> {"Item","Type"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"};
set Spans := {"-1_-1","0_0","0_26","10_10","10_12","10_25","11_11","12_12","13_13","13_25","14_14","15_15","15_25","16_16","16_25","17_17","17_25","18_18","18_19","18_25","19_19","1_1","1_2","1_3","20_20","21_21","22_22","23_23","24_24","25_25","26_26","2_2","3_3","4_4","5_25","5_5","5_6","5_7","6_6","7_25","7_7","8_25","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Leadership"]] binary;
var z1[Assignment["Statement"]] binary;
var z2[Assignment["Telling"]] binary;
var z3[Assignment["Weapon"]] binary;
var z4[Assignment["Substance"]] binary;
var z5[Assignment["Capability"]] binary;
var z6[Assignment["Sole_instance"]] binary;
var z7[Assignment["Arriving"]] binary;
var z8[Assignment["Cardinal_numbers"]] binary;
var z9[Assignment["Political_locales"]] binary;
param probabilities0[Assignment["Leadership"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Statement"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Telling"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Weapon"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Substance"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Capability"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Sole_instance"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Arriving"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Cardinal_numbers"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Political_locales"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Leadership"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Telling"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Sole_instance"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 26};
set G[I] := <0> {"0_0","0_26"}, <1> {"0_26","1_1","1_2","1_3"}, <2> {"0_26","1_2","1_3","2_2"}, <3> {"0_26","1_3","3_3"}, <4> {"0_26","4_4"}, <5> {"0_26","5_25","5_5","5_6","5_7"}, <6> {"0_26","5_25","5_6","5_7","6_6"}, <7> {"0_26","5_25","5_7","7_25","7_7"}, <8> {"0_26","5_25","7_25","8_25","8_8"}, <9> {"0_26","5_25","7_25","8_25","9_9"}, <10> {"0_26","10_10","10_12","10_25","5_25","7_25","8_25"}, <11> {"0_26","10_12","10_25","11_11","5_25","7_25","8_25"}, <12> {"0_26","10_12","10_25","12_12","5_25","7_25","8_25"}, <13> {"0_26","10_25","13_13","13_25","5_25","7_25","8_25"}, <14> {"0_26","10_25","13_25","14_14","5_25","7_25","8_25"}, <15> {"0_26","10_25","13_25","15_15","15_25","5_25","7_25","8_25"}, <16> {"0_26","10_25","13_25","15_25","16_16","16_25","5_25","7_25","8_25"}, <17> {"0_26","10_25","13_25","15_25","16_25","17_17","17_25","5_25","7_25","8_25"}, <18> {"0_26","10_25","13_25","15_25","16_25","17_25","18_18","18_19","18_25","5_25","7_25","8_25"}, <19> {"0_26","10_25","13_25","15_25","16_25","17_25","18_19","18_25","19_19","5_25","7_25","8_25"}, <20> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","20_20","5_25","7_25","8_25"}, <21> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","21_21","5_25","7_25","8_25"}, <22> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","22_22","5_25","7_25","8_25"}, <23> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","23_23","5_25","7_25","8_25"}, <24> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","24_24","5_25","7_25","8_25"}, <25> {"0_26","10_25","13_25","15_25","16_25","17_25","18_25","25_25","5_25","7_25","8_25"}, <26> {"0_26","26_26"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Telling"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Sole_instance"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Leadership"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Statement"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Telling"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Weapon"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Substance"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Capability"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Sole_instance"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Arriving"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
