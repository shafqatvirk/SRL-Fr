# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Locative_relation","Locale","Creating","Biological_area","Biological_area","Natural_features","Desirability","Substance","Natural_features"};
set Roles[Frames] :=  <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"}, <"Creating"> {"Purpose","Components","Time","Instrument","Place","Frequency","Created_entity","Means","Role","Cause","Purpose_of_created_entity","Depictive","Creator","Period_of_iterations","Co_participant","Beneficiary","Manner"}, <"Biological_area"> {"Relative_location","Constituent_parts","Container_possessor","Formational_cause","Descriptor","Name","Locale"}, <"Biological_area"> {"Relative_location","Constituent_parts","Container_possessor","Formational_cause","Descriptor","Name","Locale"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Desirability"> {"Parameter","Affected_party","Circumstances","Depictive","Comparison_set","Degree","Evaluee"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_20","10_10","11_11","12_12","13_13","13_14","14_14","15_15","16_16","17_17","18_18","19_19","1_1","20_20","2_19","2_2","3_19","3_3","4_19","4_4","5_19","5_5","6_11","6_19","6_6","6_7","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Locative_relation"]] binary;
var z1[Assignment["Locale"]] binary;
var z2[Assignment["Creating"]] binary;
var z3[Assignment["Biological_area"]] binary;
var z4[Assignment["Biological_area"]] binary;
var z5[Assignment["Natural_features"]] binary;
var z6[Assignment["Desirability"]] binary;
var z7[Assignment["Substance"]] binary;
var z8[Assignment["Natural_features"]] binary;
param probabilities0[Assignment["Locative_relation"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Locale"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Creating"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Biological_area"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Biological_area"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Natural_features"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Desirability"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Substance"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Natural_features"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Locative_relation"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Creating"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Biological_area"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Biological_area"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Desirability"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 20};
set G[I] := <0> {"0_0","0_20"}, <1> {"0_20","1_1"}, <2> {"0_20","2_19","2_2"}, <3> {"0_20","2_19","3_19","3_3"}, <4> {"0_20","2_19","3_19","4_19","4_4"}, <5> {"0_20","2_19","3_19","4_19","5_19","5_5"}, <6> {"0_20","2_19","3_19","4_19","5_19","6_11","6_19","6_6","6_7"}, <7> {"0_20","2_19","3_19","4_19","5_19","6_11","6_19","6_7","7_7"}, <8> {"0_20","2_19","3_19","4_19","5_19","6_11","6_19","8_8"}, <9> {"0_20","2_19","3_19","4_19","5_19","6_11","6_19","9_9"}, <10> {"0_20","10_10","2_19","3_19","4_19","5_19","6_11","6_19"}, <11> {"0_20","11_11","2_19","3_19","4_19","5_19","6_11","6_19"}, <12> {"0_20","12_12","2_19","3_19","4_19","5_19","6_19"}, <13> {"0_20","13_13","13_14","2_19","3_19","4_19","5_19","6_19"}, <14> {"0_20","13_14","14_14","2_19","3_19","4_19","5_19","6_19"}, <15> {"0_20","15_15","2_19","3_19","4_19","5_19","6_19"}, <16> {"0_20","16_16","2_19","3_19","4_19","5_19","6_19"}, <17> {"0_20","17_17","2_19","3_19","4_19","5_19","6_19"}, <18> {"0_20","18_18","2_19","3_19","4_19","5_19","6_19"}, <19> {"0_20","19_19","2_19","3_19","4_19","5_19","6_19"}, <20> {"0_20","20_20"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Creating"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Biological_area"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Biological_area"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Desirability"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Locale"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Creating"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Biological_area"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Biological_area"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Desirability"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Substance"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc2 := {<"Cause","Creator">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
