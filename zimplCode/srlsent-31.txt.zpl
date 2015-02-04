# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Arriving","People_by_origin","Placing","Direction","Frequency","Change_of_leadership","Inclusion","Killing","Temporal_collocation","People","Killing"};
set Roles[Frames] :=  <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Placing"> {"Speed","Duration","Area","Theme","Means","Depictive","Agent","Manner","Result","Distance","Cause","Time","Source","Beneficiary","Degree","Place","Goal","Reason","Purpose","Path"}, <"Direction"> {"Base_position","Independent_variable","Degree","Path"}, <"Frequency"> {"Time_span","Attribute","Degree","Time","Event","Interval","Rate","Salient_entity"}, <"Change_of_leadership"> {"Result","Circumstances","Depictive","New_leader","Body","Old_order","Degree","Role","Function","Selector","Manner","Old_leader","Place","Means","Time"}, <"Inclusion"> {"Purpose","Total","Contrast_set","Subregion","Frequency","Part"}, <"Killing"> {"Purpose","Means","Depictive","Circumstances","Manner","Result","Explanation","Instrument","Cause","Time","Killer","Beneficiary","Degree","Place","Frequency","Reason","Period_of_iterations","Victim"}, <"Temporal_collocation"> {"Event_description","Landmark_period","Trajector_entity","Landmark_entity","Landmark_event","Trajector_period","Trajector_event"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Killing"> {"Purpose","Means","Depictive","Circumstances","Manner","Result","Explanation","Instrument","Cause","Time","Killer","Beneficiary","Degree","Place","Frequency","Reason","Period_of_iterations","Victim"};
set Spans := {"-1_-1","0_0","0_1","0_24","10_10","11_11","11_23","12_12","12_13","12_23","13_13","14_14","14_23","15_15","15_23","16_16","17_17","17_23","18_18","18_22","18_23","19_19","1_1","20_20","20_21","21_21","22_22","23_23","24_24","2_2","3_3","3_4","4_4","5_5","6_6","7_7","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Arriving"]] binary;
var z1[Assignment["People_by_origin"]] binary;
var z2[Assignment["Placing"]] binary;
var z3[Assignment["Direction"]] binary;
var z4[Assignment["Frequency"]] binary;
var z5[Assignment["Change_of_leadership"]] binary;
var z6[Assignment["Inclusion"]] binary;
var z7[Assignment["Killing"]] binary;
var z8[Assignment["Temporal_collocation"]] binary;
var z9[Assignment["People"]] binary;
var z10[Assignment["Killing"]] binary;
param probabilities0[Assignment["Arriving"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["People_by_origin"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Placing"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Direction"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Frequency"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Change_of_leadership"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Inclusion"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Killing"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Temporal_collocation"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["People"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Killing"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Arriving"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["People_by_origin"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Placing"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Direction"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Frequency"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Change_of_leadership"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Inclusion"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Killing"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Temporal_collocation"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["People"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Killing"] : probabilities10[r,s] * z10[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 24};
set G[I] := <0> {"0_0","0_1","0_24"}, <1> {"0_1","0_24","1_1"}, <2> {"0_24","2_2"}, <3> {"0_24","3_3","3_4"}, <4> {"0_24","3_4","4_4"}, <5> {"0_24","5_5"}, <6> {"0_24","6_6"}, <7> {"0_24","7_7"}, <8> {"0_24","8_8","8_9"}, <9> {"0_24","8_9","9_9"}, <10> {"0_24","10_10"}, <11> {"0_24","11_11","11_23"}, <12> {"0_24","11_23","12_12","12_13","12_23"}, <13> {"0_24","11_23","12_13","12_23","13_13"}, <14> {"0_24","11_23","12_23","14_14","14_23"}, <15> {"0_24","11_23","12_23","14_23","15_15","15_23"}, <16> {"0_24","11_23","12_23","14_23","15_23","16_16"}, <17> {"0_24","11_23","12_23","14_23","15_23","17_17","17_23"}, <18> {"0_24","11_23","12_23","14_23","15_23","17_23","18_18","18_22","18_23"}, <19> {"0_24","11_23","12_23","14_23","15_23","17_23","18_22","18_23","19_19"}, <20> {"0_24","11_23","12_23","14_23","15_23","17_23","18_22","18_23","20_20","20_21"}, <21> {"0_24","11_23","12_23","14_23","15_23","17_23","18_22","18_23","20_21","21_21"}, <22> {"0_24","11_23","12_23","14_23","15_23","17_23","18_22","18_23","22_22"}, <23> {"0_24","11_23","12_23","14_23","15_23","17_23","18_23","23_23"}, <24> {"0_24","24_24"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Placing"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Direction"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Frequency"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Change_of_leadership"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Inclusion"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Killing"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Temporal_collocation"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Killing"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Arriving"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Placing"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Direction"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Frequency"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Change_of_leadership"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Inclusion"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Killing"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Temporal_collocation"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["People"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Killing"] do sum <s> in Spans : z10[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Agent","Cause">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc4 := {<"Degree","Rate">,<"Interval","Salient_entity">,<"Event","Salient_entity">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc5 := {<"Old_order","Role">,<"Function","Old_order">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc7 := {<"Cause","Killer">,<"Cause","Means">,<"Cause","Instrument">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
set Exc8 := {<"Trajector_event","Trajector_period">,<"Landmark_entity","Landmark_event">,<"Landmark_event","Landmark_period">,<"Trajector_entity","Trajector_event">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
set Exc10 := {<"Cause","Killer">,<"Cause","Means">,<"Cause","Instrument">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
#pairwise requirement constraint