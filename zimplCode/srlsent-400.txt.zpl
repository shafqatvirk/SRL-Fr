# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Capability","Choosing","Desirable_event","Arriving","Foreign_or_domestic_country","Buildings"};
set Roles[Frames] :=  <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Choosing"> {"Contrast","Possibilities","Cognizer","Topic","Manner","Chosen","Time","Reason","Intended_purpose"}, <"Desirable_event"> {"State_of_affairs","Purpose"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"};
set Spans := {"-1_-1","0_0","0_18","10_10","11_11","12_12","12_17","13_13","13_14","13_15","13_17","14_14","15_15","15_17","16_16","16_17","17_17","18_18","1_1","1_18","2_2","3_17","3_3","4_17","4_4","5_17","5_5","5_6","6_17","6_6","7_17","7_7","8_8","9_10","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Capability"]] binary;
var z1[Assignment["Choosing"]] binary;
var z2[Assignment["Desirable_event"]] binary;
var z3[Assignment["Arriving"]] binary;
var z4[Assignment["Foreign_or_domestic_country"]] binary;
var z5[Assignment["Buildings"]] binary;
param probabilities0[Assignment["Capability"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Choosing"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Desirable_event"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Arriving"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Buildings"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Capability"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Choosing"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Desirable_event"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Buildings"] : probabilities5[r,s] * z5[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 18};
set G[I] := <0> {"0_0","0_18"}, <1> {"0_18","1_1","1_18"}, <2> {"0_18","1_18","2_2"}, <3> {"0_18","1_18","3_17","3_3"}, <4> {"0_18","1_18","3_17","4_17","4_4"}, <5> {"0_18","1_18","3_17","4_17","5_17","5_5","5_6"}, <6> {"0_18","1_18","3_17","4_17","5_17","5_6","6_17","6_6"}, <7> {"0_18","1_18","3_17","4_17","5_17","6_17","7_17","7_7"}, <8> {"0_18","1_18","3_17","4_17","5_17","6_17","7_17","8_8"}, <9> {"0_18","1_18","3_17","4_17","5_17","6_17","7_17","9_10","9_9"}, <10> {"0_18","10_10","1_18","3_17","4_17","5_17","6_17","7_17","9_10"}, <11> {"0_18","11_11","1_18","3_17","4_17","5_17","6_17","7_17"}, <12> {"0_18","12_12","12_17","1_18","3_17","4_17","5_17","6_17","7_17"}, <13> {"0_18","12_17","13_13","13_14","13_15","13_17","1_18","3_17","4_17","5_17","6_17","7_17"}, <14> {"0_18","12_17","13_14","13_15","13_17","14_14","1_18","3_17","4_17","5_17","6_17","7_17"}, <15> {"0_18","12_17","13_15","13_17","15_15","15_17","1_18","3_17","4_17","5_17","6_17","7_17"}, <16> {"0_18","12_17","13_17","15_17","16_16","16_17","1_18","3_17","4_17","5_17","6_17","7_17"}, <17> {"0_18","12_17","13_17","15_17","16_17","17_17","1_18","3_17","4_17","5_17","6_17","7_17"}, <18> {"0_18","18_18","1_18"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Choosing"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Desirable_event"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Capability"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Choosing"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Desirable_event"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Arriving"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Buildings"] do sum <s> in Spans : z5[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
