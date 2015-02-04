# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Foreign_or_domestic_country","Being_at_risk","Temporal_collocation","Activity_finish","Scrutiny","Intentionally_act","Response","Request","Manufacturing","Statement","Being_at_risk","Run_risk","Vehicle","Feigning"};
set Roles[Frames] :=  <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Being_at_risk"> {"Domain","Time","Place","Degree","Situation","Asset","Harmful_event","Depictive","Duration","Dangerous_entity","Frequency","Explanation"}, <"Temporal_collocation"> {"Event_description","Landmark_period","Trajector_entity","Landmark_entity","Landmark_event","Trajector_period","Trajector_event"}, <"Activity_finish"> {"Purpose","Circumstances","Subevent","Depictive","Place","Degree","Activity","Manner","Time","Means","Explanation","Agent"}, <"Scrutiny"> {"Instrument","Cognizer","Phenomenon","Degree","Manner","Ground","Time","Means","Medium","Purpose","Direction"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Response"> {"Responding_entity","Response","Agent","Manner","Dimension","Time","Role","Purpose","Trigger","Place"}, <"Request"> {"Addressee","Containing_event","Medium","Topic","Speaker","Time","Message","Iteration","Means","Manner","Depictive"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Being_at_risk"> {"Domain","Time","Place","Degree","Situation","Asset","Harmful_event","Depictive","Duration","Dangerous_entity","Frequency","Explanation"}, <"Run_risk"> {"Purpose","Iteration","Bad_outcome","Time","Severity","Circumstances","Place","Protagonist","Asset","Beneficiary","Frequency","Action","Explanation"}, <"Vehicle"> {"Itinerary","Possessor","Descriptor","Vehicle","Use"}, <"Feigning"> {"Purpose","Circumstances","Time","Place","Frequency","Degree","Period_of_iterations","Depictive","Duration","State_of_affairs","Copy","Original","Means","Explanation","Agent"};
set Spans := {"-1_-1","0_0","0_43","0_7","10_10","10_42","11_11","12_12","13_13","13_42","14_14","14_42","15_15","15_42","16_16","16_42","17_17","17_42","18_18","19_19","19_33","1_1","20_20","20_33","21_21","21_30","22_22","22_30","23_23","24_24","24_30","25_25","25_30","26_26","26_30","27_27","28_28","29_29","2_2","2_4","30_30","31_31","32_32","32_33","33_33","34_34","34_42","35_35","35_42","36_36","36_42","37_37","37_38","38_38","39_39","39_42","3_3","3_4","40_40","40_41","40_42","41_41","42_42","43_43","4_4","5_5","5_6","5_7","6_6","6_7","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Foreign_or_domestic_country"]] binary;
var z1[Assignment["Being_at_risk"]] binary;
var z2[Assignment["Temporal_collocation"]] binary;
var z3[Assignment["Activity_finish"]] binary;
var z4[Assignment["Scrutiny"]] binary;
var z5[Assignment["Intentionally_act"]] binary;
var z6[Assignment["Response"]] binary;
var z7[Assignment["Request"]] binary;
var z8[Assignment["Manufacturing"]] binary;
var z9[Assignment["Statement"]] binary;
var z10[Assignment["Being_at_risk"]] binary;
var z11[Assignment["Run_risk"]] binary;
var z12[Assignment["Vehicle"]] binary;
var z13[Assignment["Feigning"]] binary;
param probabilities0[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Being_at_risk"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Temporal_collocation"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Activity_finish"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Scrutiny"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Intentionally_act"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Response"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Request"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Manufacturing"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Statement"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Being_at_risk"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Run_risk"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Vehicle"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Feigning"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Being_at_risk"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Temporal_collocation"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Activity_finish"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Scrutiny"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Response"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Request"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Being_at_risk"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Run_risk"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Vehicle"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Feigning"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 43};
set G[I] := <0> {"0_0","0_43","0_7"}, <1> {"0_43","0_7","1_1"}, <2> {"0_43","0_7","2_2","2_4"}, <3> {"0_43","0_7","2_4","3_3","3_4"}, <4> {"0_43","0_7","2_4","3_4","4_4"}, <5> {"0_43","0_7","5_5","5_6","5_7"}, <6> {"0_43","0_7","5_6","5_7","6_6","6_7"}, <7> {"0_43","0_7","5_7","6_7","7_7"}, <8> {"0_43","8_8"}, <9> {"0_43","9_9"}, <10> {"0_43","10_10","10_42"}, <11> {"0_43","10_42","11_11"}, <12> {"0_43","10_42","12_12"}, <13> {"0_43","10_42","13_13","13_42"}, <14> {"0_43","10_42","13_42","14_14","14_42"}, <15> {"0_43","10_42","13_42","14_42","15_15","15_42"}, <16> {"0_43","10_42","13_42","14_42","15_42","16_16","16_42"}, <17> {"0_43","10_42","13_42","14_42","15_42","16_42","17_17","17_42"}, <18> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","18_18"}, <19> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_19","19_33"}, <20> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_20","20_33"}, <21> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_21","21_30"}, <22> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_22","22_30"}, <23> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","23_23"}, <24> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_24","24_30"}, <25> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_25","25_30"}, <26> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_30","26_26","26_30"}, <27> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_30","26_30","27_27"}, <28> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_30","26_30","28_28"}, <29> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_30","26_30","29_29"}, <30> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","21_30","22_30","24_30","25_30","26_30","30_30"}, <31> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","31_31"}, <32> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","32_32","32_33"}, <33> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","19_33","20_33","32_33","33_33"}, <34> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_34","34_42"}, <35> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_35","35_42"}, <36> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_36","36_42"}, <37> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","37_37","37_38"}, <38> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","37_38","38_38"}, <39> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","39_39","39_42"}, <40> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","39_42","40_40","40_41","40_42"}, <41> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","39_42","40_41","40_42","41_41"}, <42> {"0_43","10_42","13_42","14_42","15_42","16_42","17_42","34_42","35_42","36_42","39_42","40_42","42_42"}, <43> {"0_43","43_43"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Being_at_risk"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Temporal_collocation"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Activity_finish"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Scrutiny"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Response"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Request"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Being_at_risk"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Run_risk"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Vehicle"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Feigning"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Being_at_risk"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Temporal_collocation"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Activity_finish"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Scrutiny"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Response"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Request"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Statement"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Being_at_risk"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Run_risk"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Vehicle"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Feigning"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Dangerous_entity","Harmful_event">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc2 := {<"Trajector_event","Trajector_period">,<"Landmark_entity","Landmark_event">,<"Landmark_event","Landmark_period">,<"Trajector_entity","Trajector_event">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc6 := {<"Agent","Responding_entity">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc10 := {<"Dangerous_entity","Harmful_event">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
set Exc11 := {<"Asset","Bad_outcome">};
subto exclusion11: forall <ri,rj> in Exc11 do z11[ri,"-1_-1"] + z11[rj,"-1_-1"] >= 1;
set Exc13 := {<"Copy","State_of_affairs">,<"Original","State_of_affairs">};
subto exclusion13: forall <ri,rj> in Exc13 do z13[ri,"-1_-1"] + z13[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
