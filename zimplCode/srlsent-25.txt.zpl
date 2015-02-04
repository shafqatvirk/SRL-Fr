# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"People_by_origin","Bringing","Familiarity","Objective_influence","Natural_features","Control","Creating","Dimension","Political_locales","Expansion","Part_orientational"};
set Roles[Frames] :=  <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Bringing"> {"Duration","Area","Constant_location","Theme","Means","Depictive","Agent","Manner","Explanation","Distance","Co_participant","Time","Source","Beneficiary","Degree","Place","Frequency","Goal","Purpose","Particular_iteration","Path","Carrier"}, <"Familiarity"> {"Entity","Role","Depictive","Context","Degree","Cognizer"}, <"Objective_influence"> {"Dependent_variable","Influencing_entity","Degree","Dependent_situation","Manner","Dependent_entity","Time","Circumstances","Influencing_situation","Influencing_variable"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Control"> {"Manner","Time","Controlling_entity","Dependent_situation","Dependent_entity"}, <"Creating"> {"Purpose","Components","Time","Instrument","Place","Frequency","Created_entity","Means","Role","Cause","Purpose_of_created_entity","Depictive","Creator","Period_of_iterations","Co_participant","Beneficiary","Manner"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Expansion"> {"Size_change","Item","Manner","Dimension","Time","Result_size","Degree","Rate","Initial_size"}, <"Part_orientational"> {"Part_Prop","Part","Whole"};
set Spans := {"-1_-1","0_0","0_1","0_22","10_10","11_11","12_12","12_21","13_13","13_15","13_21","14_14","15_15","16_16","16_21","17_17","17_21","18_18","18_21","19_19","19_21","1_1","20_20","21_21","22_22","2_2","2_22","3_3","3_4","4_4","5_10","5_5","6_10","6_6","6_7","7_7","8_10","8_8","9_10","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["People_by_origin"]] binary;
var z1[Assignment["Bringing"]] binary;
var z2[Assignment["Familiarity"]] binary;
var z3[Assignment["Objective_influence"]] binary;
var z4[Assignment["Natural_features"]] binary;
var z5[Assignment["Control"]] binary;
var z6[Assignment["Creating"]] binary;
var z7[Assignment["Dimension"]] binary;
var z8[Assignment["Political_locales"]] binary;
var z9[Assignment["Expansion"]] binary;
var z10[Assignment["Part_orientational"]] binary;
param probabilities0[Assignment["People_by_origin"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Bringing"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Familiarity"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Objective_influence"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Natural_features"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Control"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Creating"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Dimension"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Political_locales"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Expansion"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Part_orientational"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["People_by_origin"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Bringing"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Familiarity"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Objective_influence"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Control"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Creating"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Expansion"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities10[r,s] * z10[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 22};
set G[I] := <0> {"0_0","0_1","0_22"}, <1> {"0_1","0_22","1_1"}, <2> {"0_22","2_2","2_22"}, <3> {"0_22","2_22","3_3","3_4"}, <4> {"0_22","2_22","3_4","4_4"}, <5> {"0_22","2_22","5_10","5_5"}, <6> {"0_22","2_22","5_10","6_10","6_6","6_7"}, <7> {"0_22","2_22","5_10","6_10","6_7","7_7"}, <8> {"0_22","2_22","5_10","6_10","8_10","8_8"}, <9> {"0_22","2_22","5_10","6_10","8_10","9_10","9_9"}, <10> {"0_22","10_10","2_22","5_10","6_10","8_10","9_10"}, <11> {"0_22","11_11","2_22"}, <12> {"0_22","12_12","12_21","2_22"}, <13> {"0_22","12_21","13_13","13_15","13_21","2_22"}, <14> {"0_22","12_21","13_15","13_21","14_14","2_22"}, <15> {"0_22","12_21","13_15","13_21","15_15","2_22"}, <16> {"0_22","12_21","13_21","16_16","16_21","2_22"}, <17> {"0_22","12_21","13_21","16_21","17_17","17_21","2_22"}, <18> {"0_22","12_21","13_21","16_21","17_21","18_18","18_21","2_22"}, <19> {"0_22","12_21","13_21","16_21","17_21","18_21","19_19","19_21","2_22"}, <20> {"0_22","12_21","13_21","16_21","17_21","18_21","19_21","20_20","2_22"}, <21> {"0_22","12_21","13_21","16_21","17_21","18_21","19_21","21_21","2_22"}, <22> {"0_22","22_22","2_22"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Bringing"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Familiarity"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Objective_influence"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Control"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Creating"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Expansion"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Bringing"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Familiarity"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Objective_influence"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Control"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Creating"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Dimension"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Expansion"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z10[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc3 := {<"Influencing_entity","Influencing_variable">,<"Influencing_entity","Influencing_situation">,<"Influencing_situation","Influencing_variable">,<"Dependent_entity","Dependent_variable">,<"Dependent_situation","Dependent_variable">,<"Dependent_entity","Dependent_situation">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc6 := {<"Cause","Creator">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
#pairwise requirement constraint