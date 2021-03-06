# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Locale_by_use","Part_whole","Dispersal","Roadways"};
set Roles[Frames] :=  <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Part_whole"> {"Part","Whole","Part_Prop","Orientation"}, <"Dispersal"> {"Place","Agent","Result","Goal_area","Path","Manner","Individuals","Time","Reason","Means","Cause"}, <"Roadways"> {"Characteristic","Length","Use","Frequency_of_use","Goal","Relative_location","Endpoints","Direction","Source","Material","Path","Roadway","Name","Abundant_entities"};
set Spans := {"-1_-1","0_0","0_10","0_3","0_4","10_10","1_1","2_2","3_3","4_4","5_10","5_5","6_6","6_9","7_7","7_9","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Locale_by_use"]] binary;
var z1[Assignment["Part_whole"]] binary;
var z2[Assignment["Dispersal"]] binary;
var z3[Assignment["Roadways"]] binary;
param probabilities0[Assignment["Locale_by_use"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Part_whole"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Dispersal"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Roadways"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Locale_by_use"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Part_whole"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Dispersal"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Roadways"] : probabilities3[r,s] * z3[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 10};
set G[I] := <0> {"0_0","0_10","0_3","0_4"}, <1> {"0_10","0_3","0_4","1_1"}, <2> {"0_10","0_3","0_4","2_2"}, <3> {"0_10","0_3","0_4","3_3"}, <4> {"0_10","0_4","4_4"}, <5> {"0_10","5_10","5_5"}, <6> {"0_10","5_10","6_6","6_9"}, <7> {"0_10","5_10","6_9","7_7","7_9"}, <8> {"0_10","5_10","6_9","7_9","8_8","8_9"}, <9> {"0_10","5_10","6_9","7_9","8_9","9_9"}, <10> {"0_10","10_10","5_10"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Part_whole"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Dispersal"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Roadways"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Part_whole"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Dispersal"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Roadways"] do sum <s> in Spans : z3[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Agent","Cause">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
