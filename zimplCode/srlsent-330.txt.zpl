# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Process_continue","Discussion","Political_locales","Part_orientational","Arriving","Part_orientational","Activity_ongoing","Operating_a_system","Locale_by_use"};
set Roles[Frames] :=  <"Process_continue"> {"Duration","Place","Manner","Time","Circumstances","Depictive","Event","Concessive"}, <"Discussion"> {"Purpose","Topic","Depictive","Containing_event","Amount_of_discussion","Frequency","Means","Interlocutor_2","Interlocutor_1","Period_of_iterations","Means_of_communication","Domain","Duration","Place","Manner","Interlocutors","Time"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Activity_ongoing"> {"Purpose","Circumstances","Depictive","Activity","Event_description","Duration","Manner","Time","Explanation","Means","Subevent","Agent"}, <"Operating_a_system"> {"Duration","Place","System","Manner","Time","Means","Purpose","Operator"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_15","0_34","10_10","10_13","11_11","11_13","12_12","12_13","13_13","14_14","14_15","15_15","16_16","17_17","17_18","18_18","19_19","1_1","1_13","1_14","1_15","20_20","20_33","21_21","21_33","22_22","22_27","23_23","24_24","24_25","24_26","25_25","25_26","26_26","27_27","28_28","28_33","29_29","29_33","2_2","2_5","30_30","30_33","31_31","32_32","33_33","34_34","3_3","3_5","4_4","5_5","6_13","6_6","7_10","7_13","7_7","7_9","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Process_continue"]] binary;
var z1[Assignment["Discussion"]] binary;
var z2[Assignment["Political_locales"]] binary;
var z3[Assignment["Part_orientational"]] binary;
var z4[Assignment["Arriving"]] binary;
var z5[Assignment["Part_orientational"]] binary;
var z6[Assignment["Activity_ongoing"]] binary;
var z7[Assignment["Operating_a_system"]] binary;
var z8[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Process_continue"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Discussion"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Political_locales"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Part_orientational"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Arriving"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Part_orientational"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Activity_ongoing"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Operating_a_system"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Locale_by_use"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Process_continue"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Discussion"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Activity_ongoing"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Operating_a_system"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 34};
set G[I] := <0> {"0_0","0_15","0_34"}, <1> {"0_15","0_34","1_1","1_13","1_14","1_15"}, <2> {"0_15","0_34","1_13","1_14","1_15","2_2","2_5"}, <3> {"0_15","0_34","1_13","1_14","1_15","2_5","3_3","3_5"}, <4> {"0_15","0_34","1_13","1_14","1_15","2_5","3_5","4_4"}, <5> {"0_15","0_34","1_13","1_14","1_15","2_5","3_5","5_5"}, <6> {"0_15","0_34","1_13","1_14","1_15","6_13","6_6"}, <7> {"0_15","0_34","1_13","1_14","1_15","6_13","7_10","7_13","7_7","7_9"}, <8> {"0_15","0_34","1_13","1_14","1_15","6_13","7_10","7_13","7_9","8_8"}, <9> {"0_15","0_34","1_13","1_14","1_15","6_13","7_10","7_13","7_9","9_9"}, <10> {"0_15","0_34","10_10","10_13","1_13","1_14","1_15","6_13","7_10","7_13"}, <11> {"0_15","0_34","10_13","11_11","11_13","1_13","1_14","1_15","6_13","7_13"}, <12> {"0_15","0_34","10_13","11_13","12_12","12_13","1_13","1_14","1_15","6_13","7_13"}, <13> {"0_15","0_34","10_13","11_13","12_13","13_13","1_13","1_14","1_15","6_13","7_13"}, <14> {"0_15","0_34","14_14","14_15","1_14","1_15"}, <15> {"0_15","0_34","14_15","15_15","1_15"}, <16> {"0_34","16_16"}, <17> {"0_34","17_17","17_18"}, <18> {"0_34","17_18","18_18"}, <19> {"0_34","19_19"}, <20> {"0_34","20_20","20_33"}, <21> {"0_34","20_33","21_21","21_33"}, <22> {"0_34","20_33","21_33","22_22","22_27"}, <23> {"0_34","20_33","21_33","22_27","23_23"}, <24> {"0_34","20_33","21_33","22_27","24_24","24_25","24_26"}, <25> {"0_34","20_33","21_33","22_27","24_25","24_26","25_25","25_26"}, <26> {"0_34","20_33","21_33","22_27","24_26","25_26","26_26"}, <27> {"0_34","20_33","21_33","22_27","27_27"}, <28> {"0_34","20_33","21_33","28_28","28_33"}, <29> {"0_34","20_33","21_33","28_33","29_29","29_33"}, <30> {"0_34","20_33","21_33","28_33","29_33","30_30","30_33"}, <31> {"0_34","20_33","21_33","28_33","29_33","30_33","31_31"}, <32> {"0_34","20_33","21_33","28_33","29_33","30_33","32_32"}, <33> {"0_34","20_33","21_33","28_33","29_33","30_33","33_33"}, <34> {"0_34","34_34"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Process_continue"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Discussion"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Activity_ongoing"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Operating_a_system"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Process_continue"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Discussion"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Arriving"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Activity_ongoing"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Operating_a_system"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Interlocutor_1","Interlocutors">,<"Interlocutor_2","Interlocutors">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr1 := {<"Interlocutor_1","Interlocutor_2">};
subto require1: forall <ri,rj> in Reqr1 do z1[ri,"-1_-1"] - z1[rj,"-1_-1"] == 0;
