# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Attributed_information","Importance","Supply","Weapon","Supply","Artifact","Defend"};
set Roles[Frames] :=  <"Attributed_information"> {"Text","Speaker","Proposition"}, <"Importance"> {"Place","Undertaking","Explanation","Field","Time","Factor","Reason","Frequency","Degree","Interested_party"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Defend"> {"Defender","Place","Instrument","Manner","Victim","Assailant","Means","Purpose","Depictive","Reason"};
set Spans := {"-1_-1","0_0","0_18","10_10","10_11","11_11","12_12","12_17","13_13","13_17","14_14","14_15","14_17","15_15","15_17","16_16","16_17","17_17","18_18","1_1","1_18","2_11","2_2","2_4","3_3","4_4","5_11","5_5","6_11","6_6","6_9","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Attributed_information"]] binary;
var z1[Assignment["Importance"]] binary;
var z2[Assignment["Supply"]] binary;
var z3[Assignment["Weapon"]] binary;
var z4[Assignment["Supply"]] binary;
var z5[Assignment["Artifact"]] binary;
var z6[Assignment["Defend"]] binary;
param probabilities0[Assignment["Attributed_information"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Importance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Supply"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Weapon"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Supply"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Artifact"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Defend"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Attributed_information"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Importance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Defend"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 18};
set G[I] := <0> {"0_0","0_18"}, <1> {"0_18","1_1","1_18"}, <2> {"0_18","1_18","2_11","2_2","2_4"}, <3> {"0_18","1_18","2_11","2_4","3_3"}, <4> {"0_18","1_18","2_11","2_4","4_4"}, <5> {"0_18","1_18","2_11","5_11","5_5"}, <6> {"0_18","1_18","2_11","5_11","6_11","6_6","6_9"}, <7> {"0_18","1_18","2_11","5_11","6_11","6_9","7_7"}, <8> {"0_18","1_18","2_11","5_11","6_11","6_9","8_8"}, <9> {"0_18","1_18","2_11","5_11","6_11","6_9","9_9"}, <10> {"0_18","10_10","10_11","1_18","2_11","5_11","6_11"}, <11> {"0_18","10_11","11_11","1_18","2_11","5_11","6_11"}, <12> {"0_18","12_12","12_17","1_18"}, <13> {"0_18","12_17","13_13","13_17","1_18"}, <14> {"0_18","12_17","13_17","14_14","14_15","14_17","1_18"}, <15> {"0_18","12_17","13_17","14_15","14_17","15_15","15_17","1_18"}, <16> {"0_18","12_17","13_17","14_17","15_17","16_16","16_17","1_18"}, <17> {"0_18","12_17","13_17","14_17","15_17","16_17","17_17","1_18"}, <18> {"0_18","18_18","1_18"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Attributed_information"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Importance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Defend"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Attributed_information"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Importance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Supply"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Weapon"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Supply"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Artifact"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Defend"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Field","Interested_party">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
#pairwise requirement constraint