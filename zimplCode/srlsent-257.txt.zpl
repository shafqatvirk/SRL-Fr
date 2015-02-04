# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Continued_state_of_affairs","Intentionally_act","Quantity","Military","Practice","Inclusion","Defend"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Continued_state_of_affairs"> {"State_of_affairs","Circumstances","Reference_occasion"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Military"> {"Members","Descriptor","Possessor","Goal","Domain","Force"}, <"Practice"> {"Place","Duration","Agent","Action","Iteration","Co_participant","Time","Means","Manner","Purpose","Occasion"}, <"Inclusion"> {"Purpose","Total","Contrast_set","Subregion","Frequency","Part"}, <"Defend"> {"Defender","Place","Instrument","Manner","Victim","Assailant","Means","Purpose","Depictive","Reason"};
set Spans := {"-1_-1","0_0","0_18","10_10","10_17","11_11","11_17","12_12","12_17","13_13","14_14","15_15","16_16","17_17","18_18","1_1","1_18","2_2","3_17","3_3","4_17","4_4","5_5","6_6","7_7","7_8","8_8","9_17","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Continued_state_of_affairs"]] binary;
var z2[Assignment["Intentionally_act"]] binary;
var z3[Assignment["Quantity"]] binary;
var z4[Assignment["Military"]] binary;
var z5[Assignment["Practice"]] binary;
var z6[Assignment["Inclusion"]] binary;
var z7[Assignment["Defend"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Continued_state_of_affairs"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Intentionally_act"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Quantity"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Military"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Practice"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Inclusion"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Defend"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Continued_state_of_affairs"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Military"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Practice"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Inclusion"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Defend"] : probabilities7[r,s] * z7[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 18};
set G[I] := <0> {"0_0","0_18"}, <1> {"0_18","1_1","1_18"}, <2> {"0_18","1_18","2_2"}, <3> {"0_18","1_18","3_17","3_3"}, <4> {"0_18","1_18","3_17","4_17","4_4"}, <5> {"0_18","1_18","3_17","4_17","5_5"}, <6> {"0_18","1_18","3_17","4_17","6_6"}, <7> {"0_18","1_18","3_17","4_17","7_7","7_8"}, <8> {"0_18","1_18","3_17","4_17","7_8","8_8"}, <9> {"0_18","1_18","3_17","4_17","9_17","9_9"}, <10> {"0_18","10_10","10_17","1_18","3_17","4_17","9_17"}, <11> {"0_18","10_17","11_11","11_17","1_18","3_17","4_17","9_17"}, <12> {"0_18","10_17","11_17","12_12","12_17","1_18","3_17","4_17","9_17"}, <13> {"0_18","10_17","11_17","12_17","13_13","1_18","3_17","4_17","9_17"}, <14> {"0_18","10_17","11_17","12_17","14_14","1_18","3_17","4_17","9_17"}, <15> {"0_18","10_17","11_17","12_17","15_15","1_18","3_17","4_17","9_17"}, <16> {"0_18","10_17","11_17","12_17","16_16","1_18","3_17","4_17","9_17"}, <17> {"0_18","10_17","11_17","12_17","17_17","1_18","3_17","4_17","9_17"}, <18> {"0_18","18_18","1_18"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Continued_state_of_affairs"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Military"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Practice"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Inclusion"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Defend"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Continued_state_of_affairs"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Quantity"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Military"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Practice"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Inclusion"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Defend"] do sum <s> in Spans : z7[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Individuals","Mass">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
