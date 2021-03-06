# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Supply","Artifact","Expertise","Weapon","Project","Quantity","Political_locales","Inclusion","Part_orientational"};
set Roles[Frames] :=  <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Expertise"> {"Skill","Knowledge","Degree","Manner","Behavior_product","Time","Protagonist","Role","Focal_participant"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Project"> {"Salient_entity","Duration","Agent","Goal","Manner","Name","Project","Field","Descriptor","Activity"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Inclusion"> {"Purpose","Total","Contrast_set","Subregion","Frequency","Part"}, <"Part_orientational"> {"Part_Prop","Part","Whole"};
set Spans := {"-1_-1","0_0","0_22","10_10","10_21","11_11","11_21","12_12","13_13","14_14","14_21","15_15","15_21","16_16","17_17","18_18","19_19","1_1","1_22","20_20","21_21","22_22","2_2","2_21","3_21","3_3","3_5","4_4","5_5","6_21","6_6","7_21","7_7","7_9","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Supply"]] binary;
var z1[Assignment["Artifact"]] binary;
var z2[Assignment["Expertise"]] binary;
var z3[Assignment["Weapon"]] binary;
var z4[Assignment["Project"]] binary;
var z5[Assignment["Quantity"]] binary;
var z6[Assignment["Political_locales"]] binary;
var z7[Assignment["Inclusion"]] binary;
var z8[Assignment["Part_orientational"]] binary;
param probabilities0[Assignment["Supply"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Artifact"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Expertise"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Weapon"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Project"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Quantity"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Political_locales"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Inclusion"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Part_orientational"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Supply"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Expertise"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Project"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Inclusion"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 22};
set G[I] := <0> {"0_0","0_22"}, <1> {"0_22","1_1","1_22"}, <2> {"0_22","1_22","2_2","2_21"}, <3> {"0_22","1_22","2_21","3_21","3_3","3_5"}, <4> {"0_22","1_22","2_21","3_21","3_5","4_4"}, <5> {"0_22","1_22","2_21","3_21","3_5","5_5"}, <6> {"0_22","1_22","2_21","3_21","6_21","6_6"}, <7> {"0_22","1_22","2_21","3_21","6_21","7_21","7_7","7_9"}, <8> {"0_22","1_22","2_21","3_21","6_21","7_21","7_9","8_8"}, <9> {"0_22","1_22","2_21","3_21","6_21","7_21","7_9","9_9"}, <10> {"0_22","10_10","10_21","1_22","2_21","3_21","6_21","7_21"}, <11> {"0_22","10_21","11_11","11_21","1_22","2_21","3_21","6_21","7_21"}, <12> {"0_22","10_21","11_21","12_12","1_22","2_21","3_21","6_21","7_21"}, <13> {"0_22","10_21","11_21","13_13","1_22","2_21","3_21","6_21","7_21"}, <14> {"0_22","10_21","11_21","14_14","14_21","1_22","2_21","3_21","6_21","7_21"}, <15> {"0_22","10_21","11_21","14_21","15_15","15_21","1_22","2_21","3_21","6_21","7_21"}, <16> {"0_22","10_21","11_21","14_21","15_21","16_16","1_22","2_21","3_21","6_21","7_21"}, <17> {"0_22","10_21","11_21","14_21","15_21","17_17","1_22","2_21","3_21","6_21","7_21"}, <18> {"0_22","10_21","11_21","14_21","15_21","18_18","1_22","2_21","3_21","6_21","7_21"}, <19> {"0_22","10_21","11_21","14_21","15_21","19_19","1_22","2_21","3_21","6_21","7_21"}, <20> {"0_22","10_21","11_21","14_21","15_21","1_22","20_20","2_21","3_21","6_21","7_21"}, <21> {"0_22","10_21","11_21","14_21","15_21","1_22","21_21","2_21","3_21","6_21","7_21"}, <22> {"0_22","1_22","22_22"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Expertise"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Project"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Inclusion"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Supply"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Artifact"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Expertise"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Weapon"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Project"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Quantity"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Inclusion"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Behavior_product","Knowledge">,<"Behavior_product","Role">,<"Behavior_product","Focal_participant">,<"Behavior_product","Skill">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc4 := {<"Activity","Salient_entity">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc5 := {<"Individuals","Mass">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
