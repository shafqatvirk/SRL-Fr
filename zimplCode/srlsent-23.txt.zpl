# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Origin","Political_locales","Cause_change_of_strength","Concessive","People","Origin","Locative_relation","Accomplishment","Ordinal_numbers","Measure_duration"};
set Roles[Frames] :=  <"Origin"> {"Entity","Origin"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Cause_change_of_strength"> {"Place","Agent","Containing_event","Degree","Patient","Manner","Time","Circumstances","Means","Frequency","Cause"}, <"Concessive"> {"Main_statement","Statement"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Origin"> {"Entity","Origin"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Accomplishment"> {"Domain","Circumstances","Time","Instrument","Place","Goal","Degree","Means","Outcome","Particular_iteration","Duration","Manner","Explanation","Agent"}, <"Ordinal_numbers"> {"Type","Item","Starting_point","Comparison_set","Basis_of_order"}, <"Measure_duration"> {"Agent","Count","Unit","Process"};
set Spans := {"-1_-1","0_0","0_2","0_24","0_3","0_4","10_10","11_11","12_12","12_13","12_17","13_13","14_14","14_17","15_15","15_17","16_16","17_17","18_18","19_19","19_23","1_1","20_20","20_23","21_21","21_23","22_22","23_23","24_24","2_2","3_3","3_4","4_4","5_5","6_6","7_7","8_8","9_10","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Origin"]] binary;
var z1[Assignment["Political_locales"]] binary;
var z2[Assignment["Cause_change_of_strength"]] binary;
var z3[Assignment["Concessive"]] binary;
var z4[Assignment["People"]] binary;
var z5[Assignment["Origin"]] binary;
var z6[Assignment["Locative_relation"]] binary;
var z7[Assignment["Accomplishment"]] binary;
var z8[Assignment["Ordinal_numbers"]] binary;
var z9[Assignment["Measure_duration"]] binary;
param probabilities0[Assignment["Origin"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Political_locales"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Cause_change_of_strength"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Concessive"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Origin"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Locative_relation"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Accomplishment"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Ordinal_numbers"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Measure_duration"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Origin"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Cause_change_of_strength"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Concessive"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Accomplishment"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Ordinal_numbers"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Measure_duration"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 24};
set G[I] := <0> {"0_0","0_2","0_24","0_3","0_4"}, <1> {"0_2","0_24","0_3","0_4","1_1"}, <2> {"0_2","0_24","0_3","0_4","2_2"}, <3> {"0_24","0_3","0_4","3_3","3_4"}, <4> {"0_24","0_4","3_4","4_4"}, <5> {"0_24","5_5"}, <6> {"0_24","6_6"}, <7> {"0_24","7_7"}, <8> {"0_24","8_8"}, <9> {"0_24","9_10","9_9"}, <10> {"0_24","10_10","9_10"}, <11> {"0_24","11_11"}, <12> {"0_24","12_12","12_13","12_17"}, <13> {"0_24","12_13","12_17","13_13"}, <14> {"0_24","12_17","14_14","14_17"}, <15> {"0_24","12_17","14_17","15_15","15_17"}, <16> {"0_24","12_17","14_17","15_17","16_16"}, <17> {"0_24","12_17","14_17","15_17","17_17"}, <18> {"0_24","18_18"}, <19> {"0_24","19_19","19_23"}, <20> {"0_24","19_23","20_20","20_23"}, <21> {"0_24","19_23","20_23","21_21","21_23"}, <22> {"0_24","19_23","20_23","21_23","22_22"}, <23> {"0_24","19_23","20_23","21_23","23_23"}, <24> {"0_24","24_24"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Cause_change_of_strength"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Concessive"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Accomplishment"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Ordinal_numbers"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Origin"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Cause_change_of_strength"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Concessive"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Origin"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Accomplishment"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Ordinal_numbers"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc8 := {<"Basis_of_order","Starting_point">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
