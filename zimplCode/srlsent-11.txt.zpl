# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Capability","Self_motion","Expectation","Locative_relation","Quantity","Motion"};
set Roles[Frames] :=  <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Self_motion"> {"Speed","Duration","Area","Purpose","Cotheme","Means","Depictive","Coordinated_event","Manner","Path","Result","Distance","Self_mover","Time","Source","External_cause","Place","Goal","Reason","Direction","Concessive","Internal_cause","Path_shape"}, <"Expectation"> {"Evidence","Phenomenon","Topic","Manner","Depictive","Degree","Cognizer"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Motion"> {"Speed","Duration","Area","Theme","Distance","Depictive","Manner","Result","Direction","Time","Source","Containing_event","Place","Goal","Purpose","Path","Carrier","Path_shape"};
set Spans := {"-1_-1","0_0","0_12","10_10","10_11","11_11","12_12","1_1","2_2","3_11","3_3","4_11","4_4","4_5","5_5","6_11","6_6","7_11","7_7","8_11","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Capability"]] binary;
var z1[Assignment["Self_motion"]] binary;
var z2[Assignment["Expectation"]] binary;
var z3[Assignment["Locative_relation"]] binary;
var z4[Assignment["Quantity"]] binary;
var z5[Assignment["Motion"]] binary;
param probabilities0[Assignment["Capability"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Self_motion"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Expectation"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Locative_relation"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Quantity"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Motion"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Capability"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Self_motion"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Expectation"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Motion"] : probabilities5[r,s] * z5[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 12};
set G[I] := <0> {"0_0","0_12"}, <1> {"0_12","1_1"}, <2> {"0_12","2_2"}, <3> {"0_12","3_11","3_3"}, <4> {"0_12","3_11","4_11","4_4","4_5"}, <5> {"0_12","3_11","4_11","4_5","5_5"}, <6> {"0_12","3_11","4_11","6_11","6_6"}, <7> {"0_12","3_11","4_11","6_11","7_11","7_7"}, <8> {"0_12","3_11","4_11","6_11","7_11","8_11","8_8","8_9"}, <9> {"0_12","3_11","4_11","6_11","7_11","8_11","8_9","9_9"}, <10> {"0_12","10_10","10_11","3_11","4_11","6_11","7_11","8_11"}, <11> {"0_12","10_11","11_11","3_11","4_11","6_11","7_11","8_11"}, <12> {"0_12","12_12"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Self_motion"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Expectation"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Motion"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Capability"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Self_motion"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Expectation"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Quantity"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Motion"] do sum <s> in Spans : z5[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Area","Direction">,<"Area","Goal">,<"Area","Path">,<"Area","Source">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc3 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc4 := {<"Individuals","Mass">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc5 := {<"Area","Direction">,<"Area","Distance">,<"Area","Goal">,<"Area","Path">,<"Area","Source">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
