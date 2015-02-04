# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"First_rank","Process_continue","Willingness","People","People","Supply","Quantity","Weapon","Weapon","Cognitive_connection","Artifact","Degree","Surpassing","Purpose","Weapon","Artifact","Control","Leadership"};
set Roles[Frames] :=  <"First_rank"> {"Limits_of_consideration","Item","Contrast_set"}, <"Process_continue"> {"Duration","Place","Manner","Time","Circumstances","Depictive","Event","Concessive"}, <"Willingness"> {"Explanation","Time","Activity","Degree","Frequency","Cognizer"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Cognitive_connection"> {"Point_of_view","Circumstances","Specification","Concept_2","Concept_1","Degree","Concepts"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Degree"> {"Gradable_attribute"}, <"Surpassing"> {"Attribute","Standard_item","Iteration","Profiled_attribute","Profiled_item","Time","Circumstances","Extent","Standard_attribute"}, <"Purpose"> {"Attribute","Agent","Goal","Time","Restrictor","Value","Domain","Means"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Control"> {"Manner","Time","Controlling_entity","Dependent_situation","Dependent_entity"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"};
set Spans := {"-1_-1","0_0","0_60","10_10","11_11","12_12","13_13","13_18","14_14","14_15","15_15","16_16","16_17","16_18","17_17","17_18","18_18","19_19","1_1","1_2","20_20","20_22","20_23","20_25","21_21","22_22","23_23","23_25","24_24","24_25","25_25","26_26","26_27","26_28","27_27","27_28","28_28","29_29","2_2","30_30","31_31","32_32","32_59","33_33","33_59","34_34","35_35","35_59","36_36","36_42","36_59","37_37","38_38","39_39","3_3","40_40","41_41","42_42","43_43","43_59","44_44","44_48","44_59","45_45","45_47","46_46","47_47","48_48","49_49","49_50","49_59","4_4","50_50","51_51","51_59","52_52","52_56","52_59","53_53","54_54","55_55","56_56","57_57","57_58","57_59","58_58","58_59","59_59","5_5","5_59","60_60","6_6","7_7","8_31","8_8","9_12","9_18","9_31","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["First_rank"]] binary;
var z1[Assignment["Process_continue"]] binary;
var z2[Assignment["Willingness"]] binary;
var z3[Assignment["People"]] binary;
var z4[Assignment["People"]] binary;
var z5[Assignment["Supply"]] binary;
var z6[Assignment["Quantity"]] binary;
var z7[Assignment["Weapon"]] binary;
var z8[Assignment["Weapon"]] binary;
var z9[Assignment["Cognitive_connection"]] binary;
var z10[Assignment["Artifact"]] binary;
var z11[Assignment["Degree"]] binary;
var z12[Assignment["Surpassing"]] binary;
var z13[Assignment["Purpose"]] binary;
var z14[Assignment["Weapon"]] binary;
var z15[Assignment["Artifact"]] binary;
var z16[Assignment["Control"]] binary;
var z17[Assignment["Leadership"]] binary;
param probabilities0[Assignment["First_rank"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Process_continue"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Willingness"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["People"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Supply"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Quantity"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Weapon"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Weapon"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Cognitive_connection"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Artifact"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Degree"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Surpassing"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Purpose"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Weapon"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Artifact"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Control"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Leadership"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["First_rank"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Process_continue"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Willingness"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["People"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Cognitive_connection"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Degree"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Surpassing"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Purpose"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Control"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities17[r,s] * z17[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 60};
set G[I] := <0> {"0_0","0_60"}, <1> {"0_60","1_1","1_2"}, <2> {"0_60","1_2","2_2"}, <3> {"0_60","3_3"}, <4> {"0_60","4_4"}, <5> {"0_60","5_5","5_59"}, <6> {"0_60","5_59","6_6"}, <7> {"0_60","5_59","7_7"}, <8> {"0_60","5_59","8_31","8_8"}, <9> {"0_60","5_59","8_31","9_12","9_18","9_31","9_9"}, <10> {"0_60","10_10","5_59","8_31","9_12","9_18","9_31"}, <11> {"0_60","11_11","5_59","8_31","9_12","9_18","9_31"}, <12> {"0_60","12_12","5_59","8_31","9_12","9_18","9_31"}, <13> {"0_60","13_13","13_18","5_59","8_31","9_18","9_31"}, <14> {"0_60","13_18","14_14","14_15","5_59","8_31","9_18","9_31"}, <15> {"0_60","13_18","14_15","15_15","5_59","8_31","9_18","9_31"}, <16> {"0_60","13_18","16_16","16_17","16_18","5_59","8_31","9_18","9_31"}, <17> {"0_60","13_18","16_17","16_18","17_17","17_18","5_59","8_31","9_18","9_31"}, <18> {"0_60","13_18","16_18","17_18","18_18","5_59","8_31","9_18","9_31"}, <19> {"0_60","19_19","5_59","8_31","9_31"}, <20> {"0_60","20_20","20_22","20_23","20_25","5_59","8_31","9_31"}, <21> {"0_60","20_22","20_23","20_25","21_21","5_59","8_31","9_31"}, <22> {"0_60","20_22","20_23","20_25","22_22","5_59","8_31","9_31"}, <23> {"0_60","20_23","20_25","23_23","23_25","5_59","8_31","9_31"}, <24> {"0_60","20_25","23_25","24_24","24_25","5_59","8_31","9_31"}, <25> {"0_60","20_25","23_25","24_25","25_25","5_59","8_31","9_31"}, <26> {"0_60","26_26","26_27","26_28","5_59","8_31","9_31"}, <27> {"0_60","26_27","26_28","27_27","27_28","5_59","8_31","9_31"}, <28> {"0_60","26_28","27_28","28_28","5_59","8_31","9_31"}, <29> {"0_60","29_29","5_59","8_31","9_31"}, <30> {"0_60","30_30","5_59","8_31","9_31"}, <31> {"0_60","31_31","5_59","8_31","9_31"}, <32> {"0_60","32_32","32_59","5_59"}, <33> {"0_60","32_59","33_33","33_59","5_59"}, <34> {"0_60","32_59","33_59","34_34","5_59"}, <35> {"0_60","32_59","33_59","35_35","35_59","5_59"}, <36> {"0_60","32_59","33_59","35_59","36_36","36_42","36_59","5_59"}, <37> {"0_60","32_59","33_59","35_59","36_42","36_59","37_37","5_59"}, <38> {"0_60","32_59","33_59","35_59","36_42","36_59","38_38","5_59"}, <39> {"0_60","32_59","33_59","35_59","36_42","36_59","39_39","5_59"}, <40> {"0_60","32_59","33_59","35_59","36_42","36_59","40_40","5_59"}, <41> {"0_60","32_59","33_59","35_59","36_42","36_59","41_41","5_59"}, <42> {"0_60","32_59","33_59","35_59","36_42","36_59","42_42","5_59"}, <43> {"0_60","32_59","33_59","35_59","36_59","43_43","43_59","5_59"}, <44> {"0_60","32_59","33_59","35_59","36_59","43_59","44_44","44_48","44_59","5_59"}, <45> {"0_60","32_59","33_59","35_59","36_59","43_59","44_48","44_59","45_45","45_47","5_59"}, <46> {"0_60","32_59","33_59","35_59","36_59","43_59","44_48","44_59","45_47","46_46","5_59"}, <47> {"0_60","32_59","33_59","35_59","36_59","43_59","44_48","44_59","45_47","47_47","5_59"}, <48> {"0_60","32_59","33_59","35_59","36_59","43_59","44_48","44_59","48_48","5_59"}, <49> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_49","49_50","49_59","5_59"}, <50> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_50","49_59","50_50","5_59"}, <51> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_51","51_59","5_59"}, <52> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_52","52_56","52_59","5_59"}, <53> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_56","52_59","53_53","5_59"}, <54> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_56","52_59","54_54","5_59"}, <55> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_56","52_59","55_55","5_59"}, <56> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_56","52_59","56_56","5_59"}, <57> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_59","57_57","57_58","57_59","5_59"}, <58> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_59","57_58","57_59","58_58","58_59","5_59"}, <59> {"0_60","32_59","33_59","35_59","36_59","43_59","44_59","49_59","51_59","52_59","57_59","58_59","59_59","5_59"}, <60> {"0_60","60_60"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["First_rank"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Process_continue"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Willingness"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Cognitive_connection"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Degree"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Surpassing"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Purpose"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Control"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["First_rank"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Process_continue"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Willingness"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["People"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Supply"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Quantity"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Weapon"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Weapon"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Cognitive_connection"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Artifact"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Degree"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Surpassing"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Purpose"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Weapon"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Artifact"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Control"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Leadership"] do sum <s> in Spans : z17[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Individuals","Mass">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc9 := {<"Concept_2","Concepts">,<"Concept_1","Concepts">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
set Exc12 := {<"Attribute","Profiled_attribute">,<"Attribute","Standard_attribute">};
subto exclusion12: forall <ri,rj> in Exc12 do z12[ri,"-1_-1"] + z12[rj,"-1_-1"] >= 1;
set Exc13 := {<"Attribute","Goal">,<"Goal","Value">};
subto exclusion13: forall <ri,rj> in Exc13 do z13[ri,"-1_-1"] + z13[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr13 := {<"Attribute","Value">};
subto require13: forall <ri,rj> in Reqr13 do z13[ri,"-1_-1"] - z13[rj,"-1_-1"] == 0;
