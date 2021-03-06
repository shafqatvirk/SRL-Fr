# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Sending","Leadership","Part_orientational","Execute_plan","Proliferating_in_number","Emptying","Law","Proliferating_in_number","Intentionally_act","Control","Transfer","Health_response","Entity","Artifact"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Sending"> {"Recipient","Depictive","Time","Place","Goal","Co_theme","Theme","Purpose","Source","Sender","Reason","Transport_means","Container","Path"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Execute_plan"> {"Place","Plan","Agent","Medium","Degree","Manner","Time","Circumstances","Outcome","Means","Purpose"}, <"Proliferating_in_number"> {"Difference","Circumstances","Final_number","Time","Final_state","Place","Degree","Set","Final_correlate","Duration","Attribute","Initial_correlate","Initial_number","Manner","Speed"}, <"Emptying"> {"Theme","Means","Depictive","Circumstances","Agent","Manner","Result","Explanation","Instrument","Cause","Time","Source","Containing_event","Degree","Place","Goal","Purpose","Path"}, <"Law"> {"Type","Use","Time_of_creation","Required","Name","Law","Jurisdiction","Forbidden","Creator"}, <"Proliferating_in_number"> {"Difference","Circumstances","Final_number","Time","Final_state","Place","Degree","Set","Final_correlate","Duration","Attribute","Initial_correlate","Initial_number","Manner","Speed"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Control"> {"Manner","Time","Controlling_entity","Dependent_situation","Dependent_entity"}, <"Transfer"> {"Place","Theme","Manner","Donor","Time","Transferors","Reason","Means","Recipient","Purpose"}, <"Health_response"> {"Manner","Body_part","Protagonist","Degree","Trigger"}, <"Entity"> {"Entity","Constituent_parts","Type"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"};
set Spans := {"-1_-1","0_0","0_4","0_40","0_7","10_10","11_11","12_12","13_13","14_14","14_39","15_15","15_18","15_39","16_16","17_17","18_18","19_19","19_39","1_1","20_20","20_39","21_21","21_39","22_22","22_24","22_39","23_23","24_24","25_25","25_39","26_26","26_39","27_27","28_28","28_30","29_29","29_30","2_2","30_30","31_31","31_32","31_39","32_32","32_39","33_33","33_34","33_39","34_34","35_35","35_39","36_36","36_39","37_37","38_38","39_39","3_3","40_40","4_4","5_5","5_7","6_6","6_7","7_7","8_40","8_8","9_13","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Sending"]] binary;
var z2[Assignment["Leadership"]] binary;
var z3[Assignment["Part_orientational"]] binary;
var z4[Assignment["Execute_plan"]] binary;
var z5[Assignment["Proliferating_in_number"]] binary;
var z6[Assignment["Emptying"]] binary;
var z7[Assignment["Law"]] binary;
var z8[Assignment["Proliferating_in_number"]] binary;
var z9[Assignment["Intentionally_act"]] binary;
var z10[Assignment["Control"]] binary;
var z11[Assignment["Transfer"]] binary;
var z12[Assignment["Health_response"]] binary;
var z13[Assignment["Entity"]] binary;
var z14[Assignment["Artifact"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Sending"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Leadership"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Part_orientational"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Execute_plan"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Proliferating_in_number"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Emptying"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Law"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Proliferating_in_number"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Intentionally_act"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Control"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Transfer"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Health_response"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Entity"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Artifact"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Sending"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Execute_plan"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Proliferating_in_number"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Emptying"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Law"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Proliferating_in_number"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Control"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Transfer"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Health_response"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Entity"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities14[r,s] * z14[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 40};
set G[I] := <0> {"0_0","0_4","0_40","0_7"}, <1> {"0_4","0_40","0_7","1_1"}, <2> {"0_4","0_40","0_7","2_2"}, <3> {"0_4","0_40","0_7","3_3"}, <4> {"0_4","0_40","0_7","4_4"}, <5> {"0_40","0_7","5_5","5_7"}, <6> {"0_40","0_7","5_7","6_6","6_7"}, <7> {"0_40","0_7","5_7","6_7","7_7"}, <8> {"0_40","8_40","8_8"}, <9> {"0_40","8_40","9_13","9_9"}, <10> {"0_40","10_10","8_40","9_13"}, <11> {"0_40","11_11","8_40","9_13"}, <12> {"0_40","12_12","8_40","9_13"}, <13> {"0_40","13_13","8_40","9_13"}, <14> {"0_40","14_14","14_39","8_40"}, <15> {"0_40","14_39","15_15","15_18","15_39","8_40"}, <16> {"0_40","14_39","15_18","15_39","16_16","8_40"}, <17> {"0_40","14_39","15_18","15_39","17_17","8_40"}, <18> {"0_40","14_39","15_18","15_39","18_18","8_40"}, <19> {"0_40","14_39","15_39","19_19","19_39","8_40"}, <20> {"0_40","14_39","15_39","19_39","20_20","20_39","8_40"}, <21> {"0_40","14_39","15_39","19_39","20_39","21_21","21_39","8_40"}, <22> {"0_40","14_39","15_39","19_39","20_39","21_39","22_22","22_24","22_39","8_40"}, <23> {"0_40","14_39","15_39","19_39","20_39","21_39","22_24","22_39","23_23","8_40"}, <24> {"0_40","14_39","15_39","19_39","20_39","21_39","22_24","22_39","24_24","8_40"}, <25> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_25","25_39","8_40"}, <26> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_26","26_39","8_40"}, <27> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","27_27","8_40"}, <28> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","28_28","28_30","8_40"}, <29> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","28_30","29_29","29_30","8_40"}, <30> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","28_30","29_30","30_30","8_40"}, <31> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_31","31_32","31_39","8_40"}, <32> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_32","31_39","32_32","32_39","8_40"}, <33> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_33","33_34","33_39","8_40"}, <34> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_34","33_39","34_34","8_40"}, <35> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_39","35_35","35_39","8_40"}, <36> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_39","35_39","36_36","36_39","8_40"}, <37> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_39","35_39","36_39","37_37","8_40"}, <38> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_39","35_39","36_39","38_38","8_40"}, <39> {"0_40","14_39","15_39","19_39","20_39","21_39","22_39","25_39","26_39","31_39","32_39","33_39","35_39","36_39","39_39","8_40"}, <40> {"0_40","40_40","8_40"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Sending"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Execute_plan"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Proliferating_in_number"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Emptying"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Law"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Proliferating_in_number"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Control"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Transfer"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Health_response"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Entity"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Sending"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Leadership"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Execute_plan"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Proliferating_in_number"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Emptying"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Law"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Proliferating_in_number"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Control"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Transfer"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Health_response"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Entity"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Artifact"] do sum <s> in Spans : z14[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Agent","Cause">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc11 := {<"Donor","Transferors">,<"Recipient","Transferors">};
subto exclusion11: forall <ri,rj> in Exc11 do z11[ri,"-1_-1"] + z11[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
