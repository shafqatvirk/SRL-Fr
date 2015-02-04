# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Range","Kinship","Self_motion","Adorning","People","Activity_prepare","Food","People_by_age","Perception_active","Quantity"};
set Roles[Frames] :=  <"Range"> {"Instrument","Event","Participant","Distance"}, <"Kinship"> {"Relatives","Descriptor","Ego","Degree","Alter"}, <"Self_motion"> {"Speed","Duration","Area","Purpose","Cotheme","Means","Depictive","Coordinated_event","Manner","Path","Result","Distance","Self_mover","Time","Source","External_cause","Place","Goal","Reason","Direction","Concessive","Internal_cause","Path_shape"}, <"Adorning"> {"Location","Theme","Subregion"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Activity_prepare"> {"Agent","Time","Degree","Means","Activity"}, <"Food"> {"Type","Descriptor","Food","Constituent_parts"}, <"People_by_age"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Perception_active"> {"Purpose","Depictive","Place","Location_of_perceiver","Expected_entity","Body_part","Direction","State","Means","Phenomenon","Duration","Manner","Perceiver_agentive","Time"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"};
set Spans := {"-1_-1","0_0","0_1","0_41","10_10","10_12","11_11","12_12","13_13","14_14","14_19","15_15","15_19","16_16","16_19","17_17","18_18","19_19","1_1","20_20","21_21","21_22","21_25","22_22","23_23","23_25","24_24","24_25","25_25","26_26","27_27","27_30","28_28","29_29","2_2","2_41","30_30","31_31","32_32","32_36","33_33","33_36","34_34","34_35","34_36","35_35","35_36","36_36","37_37","38_38","39_39","3_3","3_40","3_5","40_40","41_41","4_4","5_5","6_6","7_12","7_7","8_12","8_8","9_12","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Range"]] binary;
var z1[Assignment["Kinship"]] binary;
var z2[Assignment["Self_motion"]] binary;
var z3[Assignment["Adorning"]] binary;
var z4[Assignment["People"]] binary;
var z5[Assignment["Activity_prepare"]] binary;
var z6[Assignment["Food"]] binary;
var z7[Assignment["People_by_age"]] binary;
var z8[Assignment["Perception_active"]] binary;
var z9[Assignment["Quantity"]] binary;
param probabilities0[Assignment["Range"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Kinship"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Self_motion"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Adorning"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Activity_prepare"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Food"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["People_by_age"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Perception_active"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Quantity"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Range"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Kinship"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Self_motion"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Adorning"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Activity_prepare"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Food"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["People_by_age"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Perception_active"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 41};
set G[I] := <0> {"0_0","0_1","0_41"}, <1> {"0_1","0_41","1_1"}, <2> {"0_41","2_2","2_41"}, <3> {"0_41","2_41","3_3","3_40","3_5"}, <4> {"0_41","2_41","3_40","3_5","4_4"}, <5> {"0_41","2_41","3_40","3_5","5_5"}, <6> {"0_41","2_41","3_40","6_6"}, <7> {"0_41","2_41","3_40","7_12","7_7"}, <8> {"0_41","2_41","3_40","7_12","8_12","8_8"}, <9> {"0_41","2_41","3_40","7_12","8_12","9_12","9_9"}, <10> {"0_41","10_10","10_12","2_41","3_40","7_12","8_12","9_12"}, <11> {"0_41","10_12","11_11","2_41","3_40","7_12","8_12","9_12"}, <12> {"0_41","10_12","12_12","2_41","3_40","7_12","8_12","9_12"}, <13> {"0_41","13_13","2_41","3_40"}, <14> {"0_41","14_14","14_19","2_41","3_40"}, <15> {"0_41","14_19","15_15","15_19","2_41","3_40"}, <16> {"0_41","14_19","15_19","16_16","16_19","2_41","3_40"}, <17> {"0_41","14_19","15_19","16_19","17_17","2_41","3_40"}, <18> {"0_41","14_19","15_19","16_19","18_18","2_41","3_40"}, <19> {"0_41","14_19","15_19","16_19","19_19","2_41","3_40"}, <20> {"0_41","20_20","2_41","3_40"}, <21> {"0_41","21_21","21_22","21_25","2_41","3_40"}, <22> {"0_41","21_22","21_25","22_22","2_41","3_40"}, <23> {"0_41","21_25","23_23","23_25","2_41","3_40"}, <24> {"0_41","21_25","23_25","24_24","24_25","2_41","3_40"}, <25> {"0_41","21_25","23_25","24_25","25_25","2_41","3_40"}, <26> {"0_41","26_26","2_41","3_40"}, <27> {"0_41","27_27","27_30","2_41","3_40"}, <28> {"0_41","27_30","28_28","2_41","3_40"}, <29> {"0_41","27_30","29_29","2_41","3_40"}, <30> {"0_41","27_30","2_41","30_30","3_40"}, <31> {"0_41","2_41","31_31","3_40"}, <32> {"0_41","2_41","32_32","32_36","3_40"}, <33> {"0_41","2_41","32_36","33_33","33_36","3_40"}, <34> {"0_41","2_41","32_36","33_36","34_34","34_35","34_36","3_40"}, <35> {"0_41","2_41","32_36","33_36","34_35","34_36","35_35","35_36","3_40"}, <36> {"0_41","2_41","32_36","33_36","34_36","35_36","36_36","3_40"}, <37> {"0_41","2_41","37_37","3_40"}, <38> {"0_41","2_41","38_38","3_40"}, <39> {"0_41","2_41","39_39","3_40"}, <40> {"0_41","2_41","3_40","40_40"}, <41> {"0_41","2_41","41_41"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Range"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Kinship"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Self_motion"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Adorning"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Activity_prepare"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Food"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["People_by_age"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Perception_active"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Range"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Kinship"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Self_motion"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Adorning"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Activity_prepare"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Food"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["People_by_age"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Perception_active"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Quantity"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Ego","Relatives">,<"Alter","Relatives">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc2 := {<"Area","Direction">,<"Area","Goal">,<"Area","Path">,<"Area","Source">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc9 := {<"Individuals","Mass">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr1 := {<"Alter","Ego">};
subto require1: forall <ri,rj> in Reqr1 do z1[ri,"-1_-1"] - z1[rj,"-1_-1"] == 0;