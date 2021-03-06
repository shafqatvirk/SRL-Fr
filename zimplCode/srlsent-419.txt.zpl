# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Intentionally_act","Possession","Being_necessary","Infrastructure","Supporting","Project","Discussion","Commerce_buy","Artifact","Ranked_expectation","Locale_by_use","Supporting","Quantity"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Being_necessary"> {"Dependent","Requirement","Degree","Domain","Condition","Time","Required_entity","Reason","Descriptor","Dependent_individual"}, <"Infrastructure"> {"Possessor","User","Descriptor","Place","Resource","Infrastructure","Activity"}, <"Supporting"> {"Event_description","Place","Supported","Degree","Manner","Time","Supporter","Means"}, <"Project"> {"Salient_entity","Duration","Agent","Goal","Manner","Name","Project","Field","Descriptor","Activity"}, <"Discussion"> {"Purpose","Topic","Depictive","Containing_event","Amount_of_discussion","Frequency","Means","Interlocutor_2","Interlocutor_1","Period_of_iterations","Means_of_communication","Domain","Duration","Place","Manner","Interlocutors","Time"}, <"Commerce_buy"> {"Recipient","Time","Goods","Place","Purpose_of_goods","Seller","Purpose","Rate","Manner","Buyer","Means","Money"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Ranked_expectation"> {"Entity"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Supporting"> {"Event_description","Place","Supported","Degree","Manner","Time","Supporter","Means"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"};
set Spans := {"-1_-1","0_0","0_33","10_10","10_13","11_11","12_12","13_13","14_14","15_15","15_32","16_16","16_32","17_17","18_18","18_32","19_19","19_32","1_1","1_33","20_20","20_32","21_21","21_32","22_22","22_25","22_32","23_23","24_24","25_25","26_26","26_27","26_32","27_27","27_32","28_28","28_32","29_29","29_32","2_2","30_30","30_32","31_31","32_32","33_33","3_3","4_32","4_4","5_13","5_5","5_7","6_6","7_7","8_13","8_8","8_9","9_13","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Intentionally_act"]] binary;
var z2[Assignment["Possession"]] binary;
var z3[Assignment["Being_necessary"]] binary;
var z4[Assignment["Infrastructure"]] binary;
var z5[Assignment["Supporting"]] binary;
var z6[Assignment["Project"]] binary;
var z7[Assignment["Discussion"]] binary;
var z8[Assignment["Commerce_buy"]] binary;
var z9[Assignment["Artifact"]] binary;
var z10[Assignment["Ranked_expectation"]] binary;
var z11[Assignment["Locale_by_use"]] binary;
var z12[Assignment["Supporting"]] binary;
var z13[Assignment["Quantity"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Intentionally_act"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Possession"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Being_necessary"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Infrastructure"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Supporting"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Project"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Discussion"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Commerce_buy"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Artifact"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Ranked_expectation"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Locale_by_use"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Supporting"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Quantity"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Being_necessary"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Infrastructure"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Supporting"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Project"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Discussion"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Commerce_buy"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Ranked_expectation"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Supporting"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 33};
set G[I] := <0> {"0_0","0_33"}, <1> {"0_33","1_1","1_33"}, <2> {"0_33","1_33","2_2"}, <3> {"0_33","1_33","3_3"}, <4> {"0_33","1_33","4_32","4_4"}, <5> {"0_33","1_33","4_32","5_13","5_5","5_7"}, <6> {"0_33","1_33","4_32","5_13","5_7","6_6"}, <7> {"0_33","1_33","4_32","5_13","5_7","7_7"}, <8> {"0_33","1_33","4_32","5_13","8_13","8_8","8_9"}, <9> {"0_33","1_33","4_32","5_13","8_13","8_9","9_13","9_9"}, <10> {"0_33","10_10","10_13","1_33","4_32","5_13","8_13","9_13"}, <11> {"0_33","10_13","11_11","1_33","4_32","5_13","8_13","9_13"}, <12> {"0_33","10_13","12_12","1_33","4_32","5_13","8_13","9_13"}, <13> {"0_33","10_13","13_13","1_33","4_32","5_13","8_13","9_13"}, <14> {"0_33","14_14","1_33","4_32"}, <15> {"0_33","15_15","15_32","1_33","4_32"}, <16> {"0_33","15_32","16_16","16_32","1_33","4_32"}, <17> {"0_33","15_32","16_32","17_17","1_33","4_32"}, <18> {"0_33","15_32","16_32","18_18","18_32","1_33","4_32"}, <19> {"0_33","15_32","16_32","18_32","19_19","19_32","1_33","4_32"}, <20> {"0_33","15_32","16_32","18_32","19_32","1_33","20_20","20_32","4_32"}, <21> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_21","21_32","4_32"}, <22> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_22","22_25","22_32","4_32"}, <23> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_25","22_32","23_23","4_32"}, <24> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_25","22_32","24_24","4_32"}, <25> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_25","22_32","25_25","4_32"}, <26> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_26","26_27","26_32","4_32"}, <27> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_27","26_32","27_27","27_32","4_32"}, <28> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_32","27_32","28_28","28_32","4_32"}, <29> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_32","27_32","28_32","29_29","29_32","4_32"}, <30> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_32","27_32","28_32","29_32","30_30","30_32","4_32"}, <31> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_32","27_32","28_32","29_32","30_32","31_31","4_32"}, <32> {"0_33","15_32","16_32","18_32","19_32","1_33","20_32","21_32","22_32","26_32","27_32","28_32","29_32","30_32","32_32","4_32"}, <33> {"0_33","1_33","33_33"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Being_necessary"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Infrastructure"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Supporting"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Project"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Discussion"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Commerce_buy"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Ranked_expectation"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Supporting"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Possession"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Being_necessary"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Infrastructure"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Supporting"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Project"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Discussion"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Commerce_buy"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Artifact"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Ranked_expectation"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Supporting"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Quantity"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Activity","Salient_entity">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc7 := {<"Interlocutor_1","Interlocutors">,<"Interlocutor_2","Interlocutors">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
set Exc13 := {<"Individuals","Mass">};
subto exclusion13: forall <ri,rj> in Exc13 do z13[ri,"-1_-1"] + z13[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr7 := {<"Interlocutor_1","Interlocutor_2">};
subto require7: forall <ri,rj> in Reqr7 do z7[ri,"-1_-1"] - z7[rj,"-1_-1"] == 0;
