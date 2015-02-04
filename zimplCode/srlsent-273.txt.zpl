# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Artifact","Transfer","Duration_attribute","Simple_name","Assistance","Cause_to_make_progress","Origin","Weapon","Change_position_on_a_scale"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Transfer"> {"Place","Theme","Manner","Donor","Time","Transferors","Reason","Means","Recipient","Purpose"}, <"Duration_attribute"> {"Degree","Period","Eventuality"}, <"Simple_name"> {"Speaker","Entity","Term"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Cause_to_make_progress"> {"Purpose","Time","Place","Degree","Rate","Means","Domain","Duration","Particular_iteration","Project","Post_state","Manner","Explanation","Agent","Prior_state"}, <"Origin"> {"Entity","Origin"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Change_position_on_a_scale"> {"Speed","Duration","Item","Value_range","Attribute","Correlate","Initial_value","Circumstances","Difference","Manner","Result","Final_state","Time","Period_of_iterations","Degree","Group","Final_correlate","Initial_correlate","Initial_state","Particular_iteration","Path","Final_value","Place"};
set Spans := {"-1_-1","0_0","0_1","0_17","10_10","10_16","11_11","11_13","11_16","12_12","13_13","14_14","15_15","16_16","17_17","1_1","2_2","3_3","4_4","5_5","6_6","7_16","7_7","8_16","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Artifact"]] binary;
var z2[Assignment["Transfer"]] binary;
var z3[Assignment["Duration_attribute"]] binary;
var z4[Assignment["Simple_name"]] binary;
var z5[Assignment["Assistance"]] binary;
var z6[Assignment["Cause_to_make_progress"]] binary;
var z7[Assignment["Origin"]] binary;
var z8[Assignment["Weapon"]] binary;
var z9[Assignment["Change_position_on_a_scale"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Artifact"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Transfer"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Duration_attribute"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Simple_name"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Assistance"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Cause_to_make_progress"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Origin"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Weapon"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Change_position_on_a_scale"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Transfer"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Duration_attribute"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Simple_name"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Cause_to_make_progress"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Change_position_on_a_scale"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 17};
set G[I] := <0> {"0_0","0_1","0_17"}, <1> {"0_1","0_17","1_1"}, <2> {"0_17","2_2"}, <3> {"0_17","3_3"}, <4> {"0_17","4_4"}, <5> {"0_17","5_5"}, <6> {"0_17","6_6"}, <7> {"0_17","7_16","7_7"}, <8> {"0_17","7_16","8_16","8_8","8_9"}, <9> {"0_17","7_16","8_16","8_9","9_9"}, <10> {"0_17","10_10","10_16","7_16","8_16"}, <11> {"0_17","10_16","11_11","11_13","11_16","7_16","8_16"}, <12> {"0_17","10_16","11_13","11_16","12_12","7_16","8_16"}, <13> {"0_17","10_16","11_13","11_16","13_13","7_16","8_16"}, <14> {"0_17","10_16","11_16","14_14","7_16","8_16"}, <15> {"0_17","10_16","11_16","15_15","7_16","8_16"}, <16> {"0_17","10_16","11_16","16_16","7_16","8_16"}, <17> {"0_17","17_17"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Transfer"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Duration_attribute"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Simple_name"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Cause_to_make_progress"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Change_position_on_a_scale"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Artifact"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Transfer"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Duration_attribute"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Simple_name"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Assistance"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Cause_to_make_progress"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Origin"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Weapon"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Change_position_on_a_scale"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Donor","Transferors">,<"Recipient","Transferors">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc9 := {<"Initial_state","Value_range">,<"Final_value","Value_range">,<"Initial_value","Value_range">,<"Final_state","Value_range">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
#pairwise requirement constraint