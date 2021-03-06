# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Event","Sign","Temporal_subregion","Success_or_failure","Locale_by_use","Temporal_subregion","Calendric_unit","Perception_experience","Relational_quantity","Quantity","Part_orientational","Calendric_unit"};
set Roles[Frames] :=  <"Event"> {"Time","Duration","Place","Manner","Reason","Event","Frequency"}, <"Sign"> {"Degree","Indicator","Indicated"}, <"Temporal_subregion"> {"Time_period","Time","Degree","Sub_part"}, <"Success_or_failure"> {"Place","Agent","Goal","Degree","Re_enconding","Depictive","Explanation","Time","Circumstances","Means","Role"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Temporal_subregion"> {"Time_period","Time","Degree","Sub_part"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Perception_experience"> {"Perceiver_passive","Location_of_perceiver","Circumstances","Depictive","Place","Frequency","Degree","Body_part","Direction","State","Means","Phenomenon","Duration","Manner","Concessive","Time"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"};
set Spans := {"-1_-1","0_0","0_1","0_32","10_10","11_11","12_12","13_13","14_14","15_15","16_16","16_31","17_17","17_18","17_31","18_18","19_19","19_31","1_1","20_20","20_21","20_31","21_21","22_22","22_31","23_23","23_31","24_24","24_31","25_25","26_26","26_28","27_27","27_28","28_28","29_29","29_31","2_2","30_30","30_31","31_31","32_32","3_3","4_31","4_4","5_12","5_15","5_31","5_5","5_6","6_6","7_12","7_7","8_12","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Event"]] binary;
var z1[Assignment["Sign"]] binary;
var z2[Assignment["Temporal_subregion"]] binary;
var z3[Assignment["Success_or_failure"]] binary;
var z4[Assignment["Locale_by_use"]] binary;
var z5[Assignment["Temporal_subregion"]] binary;
var z6[Assignment["Calendric_unit"]] binary;
var z7[Assignment["Perception_experience"]] binary;
var z8[Assignment["Relational_quantity"]] binary;
var z9[Assignment["Quantity"]] binary;
var z10[Assignment["Part_orientational"]] binary;
var z11[Assignment["Calendric_unit"]] binary;
param probabilities0[Assignment["Event"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Sign"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Temporal_subregion"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Success_or_failure"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Locale_by_use"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Temporal_subregion"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Calendric_unit"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Perception_experience"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Relational_quantity"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Quantity"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Part_orientational"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Calendric_unit"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Event"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Sign"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Temporal_subregion"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Success_or_failure"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Temporal_subregion"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Perception_experience"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities11[r,s] * z11[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 32};
set G[I] := <0> {"0_0","0_1","0_32"}, <1> {"0_1","0_32","1_1"}, <2> {"0_32","2_2"}, <3> {"0_32","3_3"}, <4> {"0_32","4_31","4_4"}, <5> {"0_32","4_31","5_12","5_15","5_31","5_5","5_6"}, <6> {"0_32","4_31","5_12","5_15","5_31","5_6","6_6"}, <7> {"0_32","4_31","5_12","5_15","5_31","7_12","7_7"}, <8> {"0_32","4_31","5_12","5_15","5_31","7_12","8_12","8_8"}, <9> {"0_32","4_31","5_12","5_15","5_31","7_12","8_12","9_9"}, <10> {"0_32","10_10","4_31","5_12","5_15","5_31","7_12","8_12"}, <11> {"0_32","11_11","4_31","5_12","5_15","5_31","7_12","8_12"}, <12> {"0_32","12_12","4_31","5_12","5_15","5_31","7_12","8_12"}, <13> {"0_32","13_13","4_31","5_15","5_31"}, <14> {"0_32","14_14","4_31","5_15","5_31"}, <15> {"0_32","15_15","4_31","5_15","5_31"}, <16> {"0_32","16_16","16_31","4_31","5_31"}, <17> {"0_32","16_31","17_17","17_18","17_31","4_31","5_31"}, <18> {"0_32","16_31","17_18","17_31","18_18","4_31","5_31"}, <19> {"0_32","16_31","17_31","19_19","19_31","4_31","5_31"}, <20> {"0_32","16_31","17_31","19_31","20_20","20_21","20_31","4_31","5_31"}, <21> {"0_32","16_31","17_31","19_31","20_21","20_31","21_21","4_31","5_31"}, <22> {"0_32","16_31","17_31","19_31","20_31","22_22","22_31","4_31","5_31"}, <23> {"0_32","16_31","17_31","19_31","20_31","22_31","23_23","23_31","4_31","5_31"}, <24> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_24","24_31","4_31","5_31"}, <25> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","25_25","4_31","5_31"}, <26> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","26_26","26_28","4_31","5_31"}, <27> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","26_28","27_27","27_28","4_31","5_31"}, <28> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","26_28","27_28","28_28","4_31","5_31"}, <29> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","29_29","29_31","4_31","5_31"}, <30> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","29_31","30_30","30_31","4_31","5_31"}, <31> {"0_32","16_31","17_31","19_31","20_31","22_31","23_31","24_31","29_31","30_31","31_31","4_31","5_31"}, <32> {"0_32","32_32"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Event"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Sign"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Temporal_subregion"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Success_or_failure"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Temporal_subregion"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Perception_experience"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Event"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Sign"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Temporal_subregion"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Success_or_failure"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Temporal_subregion"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Perception_experience"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Quantity"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z11[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Goal","Role">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc9 := {<"Individuals","Mass">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
