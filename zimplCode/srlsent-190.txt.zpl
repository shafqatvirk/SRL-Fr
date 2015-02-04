# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Opinion","Activity_ready_state","Becoming_a_member","Process","Concessive","Sole_instance","Commerce_scenario","Commerce_scenario","Being_obligated","Hostile_encounter","Imposing_obligation","Intentionally_act","Relational_quantity","Success_or_failure"};
set Roles[Frames] :=  <"Opinion"> {"Cognizer","Topic","Manner","Time","Circumstances","Domain","Constancy","Opinion","Evidence"}, <"Activity_ready_state"> {"Time","Duration","Activity","Salient_entity","Degree","Protagonist"}, <"Becoming_a_member"> {"Purpose","Circumstances","Time","Place","New_member","Role","Group","Depictive","Reciprocation","Re_encoding","Manner","Explanation"}, <"Process"> {"Manner","Process"}, <"Concessive"> {"Main_statement","Statement"}, <"Sole_instance"> {"Item","Type"}, <"Commerce_scenario"> {"Goods","Seller","Rate","Means","Money","Buyer"}, <"Commerce_scenario"> {"Goods","Seller","Rate","Means","Money","Buyer"}, <"Being_obligated"> {"Condition","Responsible_party","Place","Frequency","Duty"}, <"Hostile_encounter"> {"Purpose","Result","Depictive","Instrument","Place","Degree","Means","Internal_cause","Reason","Particular_iteration","Duration","Sides","Issue","Side_2","Side_1","Manner","Time"}, <"Imposing_obligation"> {"Purpose","Principle","Obligator","Responsible_party","Duty"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Success_or_failure"> {"Place","Agent","Goal","Degree","Re_enconding","Depictive","Explanation","Time","Circumstances","Means","Role"};
set Spans := {"-1_-1","0_0","0_48","10_10","11_11","12_12","13_13","14_14","14_26","14_47","15_15","15_17","15_21","15_22","15_26","16_16","17_17","18_18","18_21","19_19","19_21","1_1","1_48","20_20","21_21","22_22","22_26","23_23","23_24","23_26","24_24","24_26","25_25","25_26","26_26","27_27","28_28","28_38","29_29","29_30","29_38","2_2","2_47","30_30","31_31","31_38","32_32","32_33","32_38","33_33","33_38","34_34","34_38","35_35","35_36","35_38","36_36","37_37","38_38","39_39","3_13","3_3","40_40","41_41","42_42","43_43","43_47","44_44","44_47","45_45","45_46","45_47","46_46","46_47","47_47","48_48","4_13","4_4","5_10","5_5","6_10","6_6","6_7","7_10","7_7","8_10","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Opinion"]] binary;
var z1[Assignment["Activity_ready_state"]] binary;
var z2[Assignment["Becoming_a_member"]] binary;
var z3[Assignment["Process"]] binary;
var z4[Assignment["Concessive"]] binary;
var z5[Assignment["Sole_instance"]] binary;
var z6[Assignment["Commerce_scenario"]] binary;
var z7[Assignment["Commerce_scenario"]] binary;
var z8[Assignment["Being_obligated"]] binary;
var z9[Assignment["Hostile_encounter"]] binary;
var z10[Assignment["Imposing_obligation"]] binary;
var z11[Assignment["Intentionally_act"]] binary;
var z12[Assignment["Relational_quantity"]] binary;
var z13[Assignment["Success_or_failure"]] binary;
param probabilities0[Assignment["Opinion"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Activity_ready_state"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Becoming_a_member"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Process"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Concessive"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Sole_instance"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Commerce_scenario"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Commerce_scenario"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Being_obligated"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Hostile_encounter"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Imposing_obligation"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Intentionally_act"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Relational_quantity"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Success_or_failure"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Opinion"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Activity_ready_state"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Becoming_a_member"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Process"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Concessive"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Sole_instance"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Commerce_scenario"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Commerce_scenario"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Being_obligated"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Hostile_encounter"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Imposing_obligation"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Success_or_failure"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 48};
set G[I] := <0> {"0_0","0_48"}, <1> {"0_48","1_1","1_48"}, <2> {"0_48","1_48","2_2","2_47"}, <3> {"0_48","1_48","2_47","3_13","3_3"}, <4> {"0_48","1_48","2_47","3_13","4_13","4_4"}, <5> {"0_48","1_48","2_47","3_13","4_13","5_10","5_5"}, <6> {"0_48","1_48","2_47","3_13","4_13","5_10","6_10","6_6","6_7"}, <7> {"0_48","1_48","2_47","3_13","4_13","5_10","6_10","6_7","7_10","7_7"}, <8> {"0_48","1_48","2_47","3_13","4_13","5_10","6_10","7_10","8_10","8_8"}, <9> {"0_48","1_48","2_47","3_13","4_13","5_10","6_10","7_10","8_10","9_9"}, <10> {"0_48","10_10","1_48","2_47","3_13","4_13","5_10","6_10","7_10","8_10"}, <11> {"0_48","11_11","1_48","2_47","3_13","4_13"}, <12> {"0_48","12_12","1_48","2_47","3_13","4_13"}, <13> {"0_48","13_13","1_48","2_47","3_13","4_13"}, <14> {"0_48","14_14","14_26","14_47","1_48","2_47"}, <15> {"0_48","14_26","14_47","15_15","15_17","15_21","15_22","15_26","1_48","2_47"}, <16> {"0_48","14_26","14_47","15_17","15_21","15_22","15_26","16_16","1_48","2_47"}, <17> {"0_48","14_26","14_47","15_17","15_21","15_22","15_26","17_17","1_48","2_47"}, <18> {"0_48","14_26","14_47","15_21","15_22","15_26","18_18","18_21","1_48","2_47"}, <19> {"0_48","14_26","14_47","15_21","15_22","15_26","18_21","19_19","19_21","1_48","2_47"}, <20> {"0_48","14_26","14_47","15_21","15_22","15_26","18_21","19_21","1_48","20_20","2_47"}, <21> {"0_48","14_26","14_47","15_21","15_22","15_26","18_21","19_21","1_48","21_21","2_47"}, <22> {"0_48","14_26","14_47","15_22","15_26","1_48","22_22","22_26","2_47"}, <23> {"0_48","14_26","14_47","15_26","1_48","22_26","23_23","23_24","23_26","2_47"}, <24> {"0_48","14_26","14_47","15_26","1_48","22_26","23_24","23_26","24_24","24_26","2_47"}, <25> {"0_48","14_26","14_47","15_26","1_48","22_26","23_26","24_26","25_25","25_26","2_47"}, <26> {"0_48","14_26","14_47","15_26","1_48","22_26","23_26","24_26","25_26","26_26","2_47"}, <27> {"0_48","14_47","1_48","27_27","2_47"}, <28> {"0_48","14_47","1_48","28_28","28_38","2_47"}, <29> {"0_48","14_47","1_48","28_38","29_29","29_30","29_38","2_47"}, <30> {"0_48","14_47","1_48","28_38","29_30","29_38","2_47","30_30"}, <31> {"0_48","14_47","1_48","28_38","29_38","2_47","31_31","31_38"}, <32> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_32","32_33","32_38"}, <33> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_33","32_38","33_33","33_38"}, <34> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_38","33_38","34_34","34_38"}, <35> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_38","33_38","34_38","35_35","35_36","35_38"}, <36> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_38","33_38","34_38","35_36","35_38","36_36"}, <37> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_38","33_38","34_38","35_38","37_37"}, <38> {"0_48","14_47","1_48","28_38","29_38","2_47","31_38","32_38","33_38","34_38","35_38","38_38"}, <39> {"0_48","14_47","1_48","2_47","39_39"}, <40> {"0_48","14_47","1_48","2_47","40_40"}, <41> {"0_48","14_47","1_48","2_47","41_41"}, <42> {"0_48","14_47","1_48","2_47","42_42"}, <43> {"0_48","14_47","1_48","2_47","43_43","43_47"}, <44> {"0_48","14_47","1_48","2_47","43_47","44_44","44_47"}, <45> {"0_48","14_47","1_48","2_47","43_47","44_47","45_45","45_46","45_47"}, <46> {"0_48","14_47","1_48","2_47","43_47","44_47","45_46","45_47","46_46","46_47"}, <47> {"0_48","14_47","1_48","2_47","43_47","44_47","45_47","46_47","47_47"}, <48> {"0_48","1_48","48_48"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Opinion"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Activity_ready_state"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Becoming_a_member"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Process"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Concessive"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Sole_instance"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Commerce_scenario"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Commerce_scenario"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Being_obligated"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Hostile_encounter"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Imposing_obligation"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Success_or_failure"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Opinion"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Activity_ready_state"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Becoming_a_member"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Process"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Concessive"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Sole_instance"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Commerce_scenario"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Commerce_scenario"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Being_obligated"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Hostile_encounter"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Imposing_obligation"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Success_or_failure"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc9 := {<"Side_1","Sides">,<"Side_2","Sides">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
set Exc13 := {<"Goal","Role">};
subto exclusion13: forall <ri,rj> in Exc13 do z13[ri,"-1_-1"] + z13[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr9 := {<"Side_1","Side_2">};
subto require9: forall <ri,rj> in Reqr9 do z9[ri,"-1_-1"] - z9[rj,"-1_-1"] == 0;
