# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Observable_body_parts","Temporal_collocation","Activity_finish","Medical_conditions","Measure_duration","Process_end","Cardinal_numbers"};
set Roles[Frames] :=  <"Observable_body_parts"> {"Attachment","Descriptor","Possessor","Body_part","Subregion","Orientational_Location"}, <"Temporal_collocation"> {"Event_description","Landmark_period","Trajector_entity","Landmark_entity","Landmark_event","Trajector_period","Trajector_event"}, <"Activity_finish"> {"Purpose","Circumstances","Subevent","Depictive","Place","Degree","Activity","Manner","Time","Means","Explanation","Agent"}, <"Medical_conditions"> {"Place","Symptom","Body_Part","Degree","Patient","Name","Ailment","Cause"}, <"Measure_duration"> {"Agent","Count","Unit","Process"}, <"Process_end"> {"Last_subevent","Place","Result","Degree","Manner","Time","Reason","Depictive","Process"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"};
set Spans := {"-1_-1","0_0","0_1","0_16","0_17","0_21","10_10","10_11","10_14","11_11","11_14","12_12","12_14","13_13","14_14","15_15","16_16","17_17","17_21","18_18","18_21","19_19","19_21","1_1","20_20","21_21","2_2","3_15","3_3","4_4","5_5","6_6","7_7","8_8","9_14","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Observable_body_parts"]] binary;
var z1[Assignment["Temporal_collocation"]] binary;
var z2[Assignment["Activity_finish"]] binary;
var z3[Assignment["Medical_conditions"]] binary;
var z4[Assignment["Measure_duration"]] binary;
var z5[Assignment["Process_end"]] binary;
var z6[Assignment["Cardinal_numbers"]] binary;
param probabilities0[Assignment["Observable_body_parts"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Temporal_collocation"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Activity_finish"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Medical_conditions"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Measure_duration"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Process_end"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Cardinal_numbers"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Observable_body_parts"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Temporal_collocation"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Activity_finish"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Medical_conditions"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Measure_duration"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Process_end"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 21};
set G[I] := <0> {"0_0","0_1","0_16","0_17","0_21"}, <1> {"0_1","0_16","0_17","0_21","1_1"}, <2> {"0_16","0_17","0_21","2_2"}, <3> {"0_16","0_17","0_21","3_15","3_3"}, <4> {"0_16","0_17","0_21","3_15","4_4"}, <5> {"0_16","0_17","0_21","3_15","5_5"}, <6> {"0_16","0_17","0_21","3_15","6_6"}, <7> {"0_16","0_17","0_21","3_15","7_7"}, <8> {"0_16","0_17","0_21","3_15","8_8"}, <9> {"0_16","0_17","0_21","3_15","9_14","9_9"}, <10> {"0_16","0_17","0_21","10_10","10_11","10_14","3_15","9_14"}, <11> {"0_16","0_17","0_21","10_11","10_14","11_11","11_14","3_15","9_14"}, <12> {"0_16","0_17","0_21","10_14","11_14","12_12","12_14","3_15","9_14"}, <13> {"0_16","0_17","0_21","10_14","11_14","12_14","13_13","3_15","9_14"}, <14> {"0_16","0_17","0_21","10_14","11_14","12_14","14_14","3_15","9_14"}, <15> {"0_16","0_17","0_21","15_15","3_15"}, <16> {"0_16","0_17","0_21","16_16"}, <17> {"0_17","0_21","17_17","17_21"}, <18> {"0_21","17_21","18_18","18_21"}, <19> {"0_21","17_21","18_21","19_19","19_21"}, <20> {"0_21","17_21","18_21","19_21","20_20"}, <21> {"0_21","17_21","18_21","19_21","21_21"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Observable_body_parts"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Temporal_collocation"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Activity_finish"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Medical_conditions"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Process_end"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Observable_body_parts"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Temporal_collocation"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Activity_finish"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Medical_conditions"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Process_end"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Trajector_event","Trajector_period">,<"Landmark_entity","Landmark_event">,<"Landmark_event","Landmark_period">,<"Trajector_entity","Trajector_event">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
#pairwise requirement constraint