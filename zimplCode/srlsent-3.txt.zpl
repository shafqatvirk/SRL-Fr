# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Working_on","Intentionally_act","Collaboration"};
set Roles[Frames] :=  <"Working_on"> {"Purpose","Descriptor","Event_description","Time","Goal","Salient_entity","Place","Frequency","Degree","Means","Domain","Depictive","Duration","Particular_iteration","Manner","Agent"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Collaboration"> {"Duration","Place","Undertaking","Partner_2","Partner_1","Time","Partners","Manner","Degree"};
set Spans := {"-1_-1","0_0","0_1","0_4","0_8","1_1","1_4","2_2","2_4","3_3","3_4","4_4","5_5","6_6","7_7","8_8"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Working_on"]] binary;
var z1[Assignment["Intentionally_act"]] binary;
var z2[Assignment["Collaboration"]] binary;
param probabilities0[Assignment["Working_on"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Intentionally_act"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Collaboration"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Working_on"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Collaboration"] : probabilities2[r,s] * z2[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 8};
set G[I] := <0> {"0_0","0_1","0_4","0_8"}, <1> {"0_1","0_4","0_8","1_1","1_4"}, <2> {"0_4","0_8","1_4","2_2","2_4"}, <3> {"0_4","0_8","1_4","2_4","3_3","3_4"}, <4> {"0_4","0_8","1_4","2_4","3_4","4_4"}, <5> {"0_8","5_5"}, <6> {"0_8","6_6"}, <7> {"0_8","7_7"}, <8> {"0_8","8_8"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Working_on"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Collaboration"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Working_on"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Collaboration"] do sum <s> in Spans : z2[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Goal","Salient_entity">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc2 := {<"Partner_2","Partners">,<"Partner_1","Partners">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr2 := {<"Partner_1","Partner_2">};
subto require2: forall <ri,rj> in Reqr2 do z2[ri,"-1_-1"] - z2[rj,"-1_-1"] == 0;
