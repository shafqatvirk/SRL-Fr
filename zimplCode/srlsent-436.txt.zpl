# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Taking_sides","Aggregate","Statement","Request","Weapon","Weapon","Substance","Processing_materials","Artifact","Relative_time","Discussion","Origin","Leadership"};
set Roles[Frames] :=  <"Taking_sides"> {"Time","Descriptor","Concessive","Place","Degree","Cognizer","Particular_iteration","Issue","Side","Manner","Action","Explanation"}, <"Aggregate"> {"Individuals","AggregateProperty","Aggregate","Name","Domain","Container_possessor"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Request"> {"Addressee","Containing_event","Medium","Topic","Speaker","Time","Message","Iteration","Means","Manner","Depictive"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Processing_materials"> {"Place","Duration","Agent","Result","Material","Dimension","Time","Alterant","Reason","Purpose","Subregion"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Relative_time"> {"Focal_participant","Interval","Degree","Focal_occasion","Landmark_occasion"}, <"Discussion"> {"Purpose","Topic","Depictive","Containing_event","Amount_of_discussion","Frequency","Means","Interlocutor_2","Interlocutor_1","Period_of_iterations","Means_of_communication","Domain","Duration","Place","Manner","Interlocutors","Time"}, <"Origin"> {"Entity","Origin"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"};
set Spans := {"-1_-1","0_0","0_1","0_28","0_4","10_10","11_11","12_12","13_13","14_14","15_15","15_17","16_16","16_17","17_17","18_18","18_27","19_19","19_27","1_1","20_20","21_21","22_22","22_24","23_23","23_24","24_24","25_25","25_26","25_27","26_26","26_27","27_27","28_28","2_2","3_3","4_4","5_28","5_5","6_27","6_6","7_27","7_7","8_27","8_8","9_10","9_14","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Taking_sides"]] binary;
var z1[Assignment["Aggregate"]] binary;
var z2[Assignment["Statement"]] binary;
var z3[Assignment["Request"]] binary;
var z4[Assignment["Weapon"]] binary;
var z5[Assignment["Weapon"]] binary;
var z6[Assignment["Substance"]] binary;
var z7[Assignment["Processing_materials"]] binary;
var z8[Assignment["Artifact"]] binary;
var z9[Assignment["Relative_time"]] binary;
var z10[Assignment["Discussion"]] binary;
var z11[Assignment["Origin"]] binary;
var z12[Assignment["Leadership"]] binary;
param probabilities0[Assignment["Taking_sides"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Aggregate"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Statement"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Request"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Weapon"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Weapon"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Substance"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Processing_materials"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Artifact"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Relative_time"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Discussion"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Origin"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Leadership"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Taking_sides"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Aggregate"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Request"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Processing_materials"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Relative_time"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Discussion"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities12[r,s] * z12[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 28};
set G[I] := <0> {"0_0","0_1","0_28","0_4"}, <1> {"0_1","0_28","0_4","1_1"}, <2> {"0_28","0_4","2_2"}, <3> {"0_28","0_4","3_3"}, <4> {"0_28","0_4","4_4"}, <5> {"0_28","5_28","5_5"}, <6> {"0_28","5_28","6_27","6_6"}, <7> {"0_28","5_28","6_27","7_27","7_7"}, <8> {"0_28","5_28","6_27","7_27","8_27","8_8"}, <9> {"0_28","5_28","6_27","7_27","8_27","9_10","9_14","9_9"}, <10> {"0_28","10_10","5_28","6_27","7_27","8_27","9_10","9_14"}, <11> {"0_28","11_11","5_28","6_27","7_27","8_27","9_14"}, <12> {"0_28","12_12","5_28","6_27","7_27","8_27","9_14"}, <13> {"0_28","13_13","5_28","6_27","7_27","8_27","9_14"}, <14> {"0_28","14_14","5_28","6_27","7_27","8_27","9_14"}, <15> {"0_28","15_15","15_17","5_28","6_27","7_27","8_27"}, <16> {"0_28","15_17","16_16","16_17","5_28","6_27","7_27","8_27"}, <17> {"0_28","15_17","16_17","17_17","5_28","6_27","7_27","8_27"}, <18> {"0_28","18_18","18_27","5_28","6_27","7_27","8_27"}, <19> {"0_28","18_27","19_19","19_27","5_28","6_27","7_27","8_27"}, <20> {"0_28","18_27","19_27","20_20","5_28","6_27","7_27","8_27"}, <21> {"0_28","18_27","19_27","21_21","5_28","6_27","7_27","8_27"}, <22> {"0_28","18_27","19_27","22_22","22_24","5_28","6_27","7_27","8_27"}, <23> {"0_28","18_27","19_27","22_24","23_23","23_24","5_28","6_27","7_27","8_27"}, <24> {"0_28","18_27","19_27","22_24","23_24","24_24","5_28","6_27","7_27","8_27"}, <25> {"0_28","18_27","19_27","25_25","25_26","25_27","5_28","6_27","7_27","8_27"}, <26> {"0_28","18_27","19_27","25_26","25_27","26_26","26_27","5_28","6_27","7_27","8_27"}, <27> {"0_28","18_27","19_27","25_27","26_27","27_27","5_28","6_27","7_27","8_27"}, <28> {"0_28","28_28","5_28"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Taking_sides"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Aggregate"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Request"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Processing_materials"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Relative_time"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Discussion"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Taking_sides"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Aggregate"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Statement"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Request"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Weapon"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Weapon"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Substance"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Processing_materials"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Artifact"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Relative_time"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Discussion"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Origin"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Leadership"] do sum <s> in Spans : z12[r,s] == 1;
#pairwise exclusion constraint
set Exc10 := {<"Interlocutor_1","Interlocutors">,<"Interlocutor_2","Interlocutors">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr10 := {<"Interlocutor_1","Interlocutor_2">};
subto require10: forall <ri,rj> in Reqr10 do z10[ri,"-1_-1"] - z10[rj,"-1_-1"] == 0;