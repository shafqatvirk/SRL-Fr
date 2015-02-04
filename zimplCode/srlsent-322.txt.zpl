# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Weapon","Change_position_on_a_scale","Using","Position_on_a_scale","Rank","Artifact"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Change_position_on_a_scale"> {"Speed","Duration","Item","Value_range","Attribute","Correlate","Initial_value","Circumstances","Difference","Manner","Result","Final_state","Time","Period_of_iterations","Degree","Group","Final_correlate","Initial_correlate","Initial_state","Particular_iteration","Path","Final_value","Place"}, <"Using"> {"Duration","Depictive","Purpose","Means","Role","Circumstances","Agent","Manner","Explanation","Outcome","Instrument","Time","Period_of_iterations","Containing_event","Degree","Place","Frequency","Group"}, <"Position_on_a_scale"> {"Domain","Value","Item","Variable","Degree"}, <"Rank"> {"Item","Rank"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"};
set Spans := {"-1_-1","0_0","0_15","0_2","10_10","11_11","12_12","13_13","14_14","15_15","1_1","2_2","3_15","3_3","4_14","4_4","5_14","5_5","5_7","5_8","6_6","7_7","8_14","8_8","9_14","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Weapon"]] binary;
var z2[Assignment["Change_position_on_a_scale"]] binary;
var z3[Assignment["Using"]] binary;
var z4[Assignment["Position_on_a_scale"]] binary;
var z5[Assignment["Rank"]] binary;
var z6[Assignment["Artifact"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Weapon"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Change_position_on_a_scale"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Using"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Position_on_a_scale"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Rank"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Artifact"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Change_position_on_a_scale"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Using"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Position_on_a_scale"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Rank"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 15};
set G[I] := <0> {"0_0","0_15","0_2"}, <1> {"0_15","0_2","1_1"}, <2> {"0_15","0_2","2_2"}, <3> {"0_15","3_15","3_3"}, <4> {"0_15","3_15","4_14","4_4"}, <5> {"0_15","3_15","4_14","5_14","5_5","5_7","5_8"}, <6> {"0_15","3_15","4_14","5_14","5_7","5_8","6_6"}, <7> {"0_15","3_15","4_14","5_14","5_7","5_8","7_7"}, <8> {"0_15","3_15","4_14","5_14","5_8","8_14","8_8"}, <9> {"0_15","3_15","4_14","5_14","8_14","9_14","9_9"}, <10> {"0_15","10_10","3_15","4_14","5_14","8_14","9_14"}, <11> {"0_15","11_11","3_15","4_14","5_14","8_14","9_14"}, <12> {"0_15","12_12","3_15","4_14","5_14","8_14","9_14"}, <13> {"0_15","13_13","3_15","4_14","5_14","8_14","9_14"}, <14> {"0_15","14_14","3_15","4_14","5_14","8_14","9_14"}, <15> {"0_15","15_15","3_15"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Change_position_on_a_scale"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Using"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Position_on_a_scale"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Rank"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Weapon"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Change_position_on_a_scale"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Using"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Position_on_a_scale"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Rank"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Artifact"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Initial_state","Value_range">,<"Final_value","Value_range">,<"Initial_value","Value_range">,<"Final_state","Value_range">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
