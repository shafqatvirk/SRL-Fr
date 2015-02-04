# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Verification","Being_obligated","Grasp","Kinship","Intentionally_act","Performers_and_roles","Being_obligated","Kinship","Used_up","Sufficiency","Timespan","Intentionally_act","Required_event","Scrutiny","Statement"};
set Roles[Frames] :=  <"Verification"> {"Purpose","Inspector","Time","Descriptor","Place","Degree","Means","Unconfirmed_content","Condition","Epistemic_stance","Manner","Explanation","Medium"}, <"Being_obligated"> {"Condition","Responsible_party","Place","Frequency","Duty"}, <"Grasp"> {"Cognizer","Phenomenon","Manner","Faculty","Time","Evidence","Category","Completeness","Reference_point"}, <"Kinship"> {"Relatives","Descriptor","Ego","Degree","Alter"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Performers_and_roles"> {"Type","Place","Performance","Performer1","Manner","Performer2","Time","Role","Medium","Performer","Event_description"}, <"Being_obligated"> {"Condition","Responsible_party","Place","Frequency","Duty"}, <"Kinship"> {"Relatives","Descriptor","Ego","Degree","Alter"}, <"Used_up"> {"Explanation","Degree","Resource","Excess"}, <"Sufficiency"> {"Item","Scale","Degree","Enabled_situation"}, <"Timespan"> {"Whole","State","Descriptor","Duration"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Required_event"> {"Explanation","Time","Purpose","Circumstances","Negative_consequences","Required_situation"}, <"Scrutiny"> {"Instrument","Cognizer","Phenomenon","Degree","Manner","Ground","Time","Means","Medium","Purpose","Direction"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"};
set Spans := {"-1_-1","0_0","0_1","0_11","0_32","10_10","10_11","11_11","12_12","13_13","13_14","13_24","14_14","14_24","15_15","15_24","16_16","17_17","17_24","18_18","18_19","18_20","18_24","19_19","1_1","1_11","20_20","20_24","21_21","21_22","21_24","22_22","23_23","23_24","24_24","25_25","26_26","27_27","28_28","28_31","29_29","29_31","2_11","2_2","30_30","31_31","32_32","3_3","3_4","4_4","5_11","5_5","6_11","6_6","6_7","7_7","8_11","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Verification"]] binary;
var z1[Assignment["Being_obligated"]] binary;
var z2[Assignment["Grasp"]] binary;
var z3[Assignment["Kinship"]] binary;
var z4[Assignment["Intentionally_act"]] binary;
var z5[Assignment["Performers_and_roles"]] binary;
var z6[Assignment["Being_obligated"]] binary;
var z7[Assignment["Kinship"]] binary;
var z8[Assignment["Used_up"]] binary;
var z9[Assignment["Sufficiency"]] binary;
var z10[Assignment["Timespan"]] binary;
var z11[Assignment["Intentionally_act"]] binary;
var z12[Assignment["Required_event"]] binary;
var z13[Assignment["Scrutiny"]] binary;
var z14[Assignment["Statement"]] binary;
param probabilities0[Assignment["Verification"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Being_obligated"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Grasp"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Kinship"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Intentionally_act"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Performers_and_roles"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Being_obligated"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Kinship"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Used_up"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Sufficiency"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Timespan"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Intentionally_act"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Required_event"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Scrutiny"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Statement"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Verification"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Being_obligated"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Grasp"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Kinship"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Performers_and_roles"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Being_obligated"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Kinship"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Used_up"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Sufficiency"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Timespan"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Required_event"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Scrutiny"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities14[r,s] * z14[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 32};
set G[I] := <0> {"0_0","0_1","0_11","0_32"}, <1> {"0_1","0_11","0_32","1_1","1_11"}, <2> {"0_11","0_32","1_11","2_11","2_2"}, <3> {"0_11","0_32","1_11","2_11","3_3","3_4"}, <4> {"0_11","0_32","1_11","2_11","3_4","4_4"}, <5> {"0_11","0_32","1_11","2_11","5_11","5_5"}, <6> {"0_11","0_32","1_11","2_11","5_11","6_11","6_6","6_7"}, <7> {"0_11","0_32","1_11","2_11","5_11","6_11","6_7","7_7"}, <8> {"0_11","0_32","1_11","2_11","5_11","6_11","8_11","8_8"}, <9> {"0_11","0_32","1_11","2_11","5_11","6_11","8_11","9_9"}, <10> {"0_11","0_32","10_10","10_11","1_11","2_11","5_11","6_11","8_11"}, <11> {"0_11","0_32","10_11","11_11","1_11","2_11","5_11","6_11","8_11"}, <12> {"0_32","12_12"}, <13> {"0_32","13_13","13_14","13_24"}, <14> {"0_32","13_14","13_24","14_14","14_24"}, <15> {"0_32","13_24","14_24","15_15","15_24"}, <16> {"0_32","13_24","14_24","15_24","16_16"}, <17> {"0_32","13_24","14_24","15_24","17_17","17_24"}, <18> {"0_32","13_24","14_24","15_24","17_24","18_18","18_19","18_20","18_24"}, <19> {"0_32","13_24","14_24","15_24","17_24","18_19","18_20","18_24","19_19"}, <20> {"0_32","13_24","14_24","15_24","17_24","18_20","18_24","20_20","20_24"}, <21> {"0_32","13_24","14_24","15_24","17_24","18_24","20_24","21_21","21_22","21_24"}, <22> {"0_32","13_24","14_24","15_24","17_24","18_24","20_24","21_22","21_24","22_22"}, <23> {"0_32","13_24","14_24","15_24","17_24","18_24","20_24","21_24","23_23","23_24"}, <24> {"0_32","13_24","14_24","15_24","17_24","18_24","20_24","21_24","23_24","24_24"}, <25> {"0_32","25_25"}, <26> {"0_32","26_26"}, <27> {"0_32","27_27"}, <28> {"0_32","28_28","28_31"}, <29> {"0_32","28_31","29_29","29_31"}, <30> {"0_32","28_31","29_31","30_30"}, <31> {"0_32","28_31","29_31","31_31"}, <32> {"0_32","32_32"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Verification"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Being_obligated"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Grasp"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Kinship"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Performers_and_roles"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Being_obligated"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Kinship"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Used_up"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Sufficiency"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Timespan"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Required_event"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Scrutiny"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Verification"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Being_obligated"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Grasp"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Kinship"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Performers_and_roles"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Being_obligated"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Kinship"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Used_up"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Sufficiency"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Timespan"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Required_event"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Scrutiny"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Statement"] do sum <s> in Spans : z14[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Cognizer","Faculty">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc3 := {<"Ego","Relatives">,<"Alter","Relatives">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc5 := {<"Performer","Performer1">,<"Performer","Performer2">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc7 := {<"Ego","Relatives">,<"Alter","Relatives">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr3 := {<"Alter","Ego">};
subto require3: forall <ri,rj> in Reqr3 do z3[ri,"-1_-1"] - z3[rj,"-1_-1"] == 0;
set Reqr5 := {<"Performer1","Performer2">};
subto require5: forall <ri,rj> in Reqr5 do z5[ri,"-1_-1"] - z5[rj,"-1_-1"] == 0;
set Reqr7 := {<"Alter","Ego">};
subto require7: forall <ri,rj> in Reqr7 do z7[ri,"-1_-1"] - z7[rj,"-1_-1"] == 0;
