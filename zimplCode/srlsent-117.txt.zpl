# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Being_up_to_it","Buildings","Motion","Path_traveled","Causation","Locale_by_use"};
set Roles[Frames] :=  <"Being_up_to_it"> {"Circumstances","Entity","Activity"}, <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Motion"> {"Speed","Duration","Area","Theme","Distance","Depictive","Manner","Result","Direction","Time","Source","Containing_event","Place","Goal","Purpose","Path","Carrier","Path_shape"}, <"Path_traveled"> {"Landmark","Characteristic","Theme","Length","Path"}, <"Causation"> {"Circumstances","Time","Actor","Place","Frequency","Means","Effect","Cause","Reason","Affected","Manner","Concessive","Explanation"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_15","0_5","0_8","10_10","11_11","11_14","12_12","12_14","13_13","14_14","15_15","1_1","1_5","2_2","2_5","3_3","4_4","5_5","6_6","7_7","8_8","9_15","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Being_up_to_it"]] binary;
var z1[Assignment["Buildings"]] binary;
var z2[Assignment["Motion"]] binary;
var z3[Assignment["Path_traveled"]] binary;
var z4[Assignment["Causation"]] binary;
var z5[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Being_up_to_it"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Buildings"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Motion"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Path_traveled"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Causation"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Locale_by_use"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Being_up_to_it"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Buildings"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Motion"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Path_traveled"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Causation"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities5[r,s] * z5[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 15};
set G[I] := <0> {"0_0","0_15","0_5","0_8"}, <1> {"0_15","0_5","0_8","1_1","1_5"}, <2> {"0_15","0_5","0_8","1_5","2_2","2_5"}, <3> {"0_15","0_5","0_8","1_5","2_5","3_3"}, <4> {"0_15","0_5","0_8","1_5","2_5","4_4"}, <5> {"0_15","0_5","0_8","1_5","2_5","5_5"}, <6> {"0_15","0_8","6_6"}, <7> {"0_15","0_8","7_7"}, <8> {"0_15","0_8","8_8"}, <9> {"0_15","9_15","9_9"}, <10> {"0_15","10_10","9_15"}, <11> {"0_15","11_11","11_14","9_15"}, <12> {"0_15","11_14","12_12","12_14","9_15"}, <13> {"0_15","11_14","12_14","13_13","9_15"}, <14> {"0_15","11_14","12_14","14_14","9_15"}, <15> {"0_15","15_15","9_15"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Being_up_to_it"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Motion"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Path_traveled"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Causation"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Being_up_to_it"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Buildings"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Motion"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Path_traveled"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Causation"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z5[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Area","Direction">,<"Area","Distance">,<"Area","Goal">,<"Area","Path">,<"Area","Source">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint