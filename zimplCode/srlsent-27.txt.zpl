# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Process_start","Commitment","Stage_of_progress","Political_locales","People","Becoming","Social_interaction_evaluation","Hostile_encounter","Origin","Political_locales","Categorization","People_by_origin","Undergoing","Commitment"};
set Roles[Frames] :=  <"Process_start"> {"Place","Initial_subevent","Manner","Time","Reason","Depictive","Frequency","Event"}, <"Commitment"> {"Addressee","Medium","Topic","Manner","Speaker","Time","Message","Purpose"}, <"Stage_of_progress"> {"Degree","Entity"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Becoming"> {"Initial_category","Initial_state","Circumstances","Time","Final_state","Place","Duration_of_final_state","Cause","Group","Final_category","Entity","Transitional_period","Reason","Manner","Explanation"}, <"Social_interaction_evaluation"> {"Affected_party","Topic","Manner","Behavior","Degree","Expressor","Evaluee"}, <"Hostile_encounter"> {"Purpose","Result","Depictive","Instrument","Place","Degree","Means","Internal_cause","Reason","Particular_iteration","Duration","Sides","Issue","Side_2","Side_1","Manner","Time"}, <"Origin"> {"Entity","Origin"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Categorization"> {"Cognizer","Item","Manner","Explanation","Criteria","Time","Circumstances","Category","Concessive"}, <"People_by_origin"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Undergoing"> {"Place","Manner","Explanation","Time","Circumstances","Reason","Entity","Purpose","Event"}, <"Commitment"> {"Addressee","Medium","Topic","Manner","Speaker","Time","Message","Purpose"};
set Spans := {"-1_-1","0_0","0_34","0_7","10_10","10_14","11_11","11_12","11_13","11_14","12_12","13_13","13_14","14_14","15_15","16_16","16_17","16_22","17_17","18_18","18_22","19_19","1_1","1_7","20_20","20_22","21_21","21_22","22_22","23_23","24_24","25_25","25_27","26_26","26_27","27_27","28_28","29_29","29_33","2_2","2_4","30_30","30_33","31_31","31_33","32_32","33_33","34_34","3_3","4_4","5_5","5_7","6_6","6_7","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Process_start"]] binary;
var z1[Assignment["Commitment"]] binary;
var z2[Assignment["Stage_of_progress"]] binary;
var z3[Assignment["Political_locales"]] binary;
var z4[Assignment["People"]] binary;
var z5[Assignment["Becoming"]] binary;
var z6[Assignment["Social_interaction_evaluation"]] binary;
var z7[Assignment["Hostile_encounter"]] binary;
var z8[Assignment["Origin"]] binary;
var z9[Assignment["Political_locales"]] binary;
var z10[Assignment["Categorization"]] binary;
var z11[Assignment["People_by_origin"]] binary;
var z12[Assignment["Undergoing"]] binary;
var z13[Assignment["Commitment"]] binary;
param probabilities0[Assignment["Process_start"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Commitment"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Stage_of_progress"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Political_locales"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Becoming"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Social_interaction_evaluation"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Hostile_encounter"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Origin"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Political_locales"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Categorization"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["People_by_origin"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Undergoing"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Commitment"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Process_start"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Commitment"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Stage_of_progress"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Becoming"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Social_interaction_evaluation"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Hostile_encounter"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Categorization"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["People_by_origin"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Undergoing"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Commitment"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 34};
set G[I] := <0> {"0_0","0_34","0_7"}, <1> {"0_34","0_7","1_1","1_7"}, <2> {"0_34","0_7","1_7","2_2","2_4"}, <3> {"0_34","0_7","1_7","2_4","3_3"}, <4> {"0_34","0_7","1_7","2_4","4_4"}, <5> {"0_34","0_7","1_7","5_5","5_7"}, <6> {"0_34","0_7","1_7","5_7","6_6","6_7"}, <7> {"0_34","0_7","1_7","5_7","6_7","7_7"}, <8> {"0_34","8_8"}, <9> {"0_34","9_9"}, <10> {"0_34","10_10","10_14"}, <11> {"0_34","10_14","11_11","11_12","11_13","11_14"}, <12> {"0_34","10_14","11_12","11_13","11_14","12_12"}, <13> {"0_34","10_14","11_13","11_14","13_13","13_14"}, <14> {"0_34","10_14","11_14","13_14","14_14"}, <15> {"0_34","15_15"}, <16> {"0_34","16_16","16_17","16_22"}, <17> {"0_34","16_17","16_22","17_17"}, <18> {"0_34","16_22","18_18","18_22"}, <19> {"0_34","16_22","18_22","19_19"}, <20> {"0_34","16_22","18_22","20_20","20_22"}, <21> {"0_34","16_22","18_22","20_22","21_21","21_22"}, <22> {"0_34","16_22","18_22","20_22","21_22","22_22"}, <23> {"0_34","23_23"}, <24> {"0_34","24_24"}, <25> {"0_34","25_25","25_27"}, <26> {"0_34","25_27","26_26","26_27"}, <27> {"0_34","25_27","26_27","27_27"}, <28> {"0_34","28_28"}, <29> {"0_34","29_29","29_33"}, <30> {"0_34","29_33","30_30","30_33"}, <31> {"0_34","29_33","30_33","31_31","31_33"}, <32> {"0_34","29_33","30_33","31_33","32_32"}, <33> {"0_34","29_33","30_33","31_33","33_33"}, <34> {"0_34","34_34"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Process_start"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Commitment"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Stage_of_progress"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Becoming"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Social_interaction_evaluation"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Hostile_encounter"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Categorization"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["People_by_origin"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Undergoing"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Commitment"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Process_start"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Commitment"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Stage_of_progress"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Becoming"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Social_interaction_evaluation"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Hostile_encounter"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Origin"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Categorization"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["People_by_origin"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Undergoing"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Commitment"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc5 := {<"Final_category","Final_state">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc6 := {<"Behavior","Topic">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc7 := {<"Side_1","Sides">,<"Side_2","Sides">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr7 := {<"Side_1","Side_2">};
subto require7: forall <ri,rj> in Reqr7 do z7[ri,"-1_-1"] - z7[rj,"-1_-1"] == 0;
