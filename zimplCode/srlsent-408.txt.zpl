# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Political_locales","Increment","Political_locales","Law","Intentionally_create","Position_on_a_scale","Building_subparts","Obviousness","Pattern","Expectation","Willingness","Intentionally_act","Political_locales"};
set Roles[Frames] :=  <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Law"> {"Type","Use","Time_of_creation","Required","Name","Law","Jurisdiction","Forbidden","Creator"}, <"Intentionally_create"> {"Created_entity","Place","Role","Manner","Components","Creator","Time","Means","Purpose","Co_participant"}, <"Position_on_a_scale"> {"Domain","Value","Item","Variable","Degree"}, <"Building_subparts"> {"Whole","Type","Building_part","Use"}, <"Obviousness"> {"Attribute","Perceiver","Phenomenon","Degree","Time","Evidence","Particular_iteration","Direction","Location_of_protagonist"}, <"Pattern"> {"Descriptor","Entities"}, <"Expectation"> {"Evidence","Phenomenon","Topic","Manner","Depictive","Degree","Cognizer"}, <"Willingness"> {"Explanation","Time","Activity","Degree","Frequency","Cognizer"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"};
set Spans := {"-1_-1","0_0","0_16","0_40","10_10","11_11","11_16","12_12","12_14","12_16","13_13","14_14","15_15","15_16","16_16","17_17","18_18","19_19","1_1","1_16","1_2","1_3","1_4","20_20","21_21","21_22","21_39","22_22","23_23","23_24","23_39","24_24","24_39","25_25","25_39","26_26","26_39","27_27","27_28","27_39","28_28","28_39","29_29","29_39","2_2","30_30","30_39","31_31","31_32","31_35","32_32","32_35","33_33","33_35","34_34","34_35","35_35","36_36","36_39","37_37","37_39","38_38","39_39","3_3","3_4","40_40","4_4","5_5","6_6","6_8","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Political_locales"]] binary;
var z1[Assignment["Increment"]] binary;
var z2[Assignment["Political_locales"]] binary;
var z3[Assignment["Law"]] binary;
var z4[Assignment["Intentionally_create"]] binary;
var z5[Assignment["Position_on_a_scale"]] binary;
var z6[Assignment["Building_subparts"]] binary;
var z7[Assignment["Obviousness"]] binary;
var z8[Assignment["Pattern"]] binary;
var z9[Assignment["Expectation"]] binary;
var z10[Assignment["Willingness"]] binary;
var z11[Assignment["Intentionally_act"]] binary;
var z12[Assignment["Political_locales"]] binary;
param probabilities0[Assignment["Political_locales"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Increment"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Political_locales"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Law"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Intentionally_create"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Position_on_a_scale"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Building_subparts"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Obviousness"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Pattern"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Expectation"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Willingness"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Intentionally_act"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Political_locales"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Political_locales"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Law"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Intentionally_create"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Position_on_a_scale"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Building_subparts"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Obviousness"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Pattern"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Expectation"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Willingness"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities12[r,s] * z12[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 40};
set G[I] := <0> {"0_0","0_16","0_40"}, <1> {"0_16","0_40","1_1","1_16","1_2","1_3","1_4"}, <2> {"0_16","0_40","1_16","1_2","1_3","1_4","2_2"}, <3> {"0_16","0_40","1_16","1_3","1_4","3_3","3_4"}, <4> {"0_16","0_40","1_16","1_4","3_4","4_4"}, <5> {"0_16","0_40","1_16","5_5"}, <6> {"0_16","0_40","1_16","6_6","6_8"}, <7> {"0_16","0_40","1_16","6_8","7_7"}, <8> {"0_16","0_40","1_16","6_8","8_8"}, <9> {"0_16","0_40","1_16","9_9"}, <10> {"0_16","0_40","10_10","1_16"}, <11> {"0_16","0_40","11_11","11_16","1_16"}, <12> {"0_16","0_40","11_16","12_12","12_14","12_16","1_16"}, <13> {"0_16","0_40","11_16","12_14","12_16","13_13","1_16"}, <14> {"0_16","0_40","11_16","12_14","12_16","14_14","1_16"}, <15> {"0_16","0_40","11_16","12_16","15_15","15_16","1_16"}, <16> {"0_16","0_40","11_16","12_16","15_16","16_16","1_16"}, <17> {"0_40","17_17"}, <18> {"0_40","18_18"}, <19> {"0_40","19_19"}, <20> {"0_40","20_20"}, <21> {"0_40","21_21","21_22","21_39"}, <22> {"0_40","21_22","21_39","22_22"}, <23> {"0_40","21_39","23_23","23_24","23_39"}, <24> {"0_40","21_39","23_24","23_39","24_24","24_39"}, <25> {"0_40","21_39","23_39","24_39","25_25","25_39"}, <26> {"0_40","21_39","23_39","24_39","25_39","26_26","26_39"}, <27> {"0_40","21_39","23_39","24_39","25_39","26_39","27_27","27_28","27_39"}, <28> {"0_40","21_39","23_39","24_39","25_39","26_39","27_28","27_39","28_28","28_39"}, <29> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_29","29_39"}, <30> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_30","30_39"}, <31> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","31_31","31_32","31_35"}, <32> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","31_32","31_35","32_32","32_35"}, <33> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","31_35","32_35","33_33","33_35"}, <34> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","31_35","32_35","33_35","34_34","34_35"}, <35> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","31_35","32_35","33_35","34_35","35_35"}, <36> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","36_36","36_39"}, <37> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","36_39","37_37","37_39"}, <38> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","36_39","37_39","38_38"}, <39> {"0_40","21_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","30_39","36_39","37_39","39_39"}, <40> {"0_40","40_40"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Law"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Intentionally_create"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Position_on_a_scale"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Building_subparts"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Obviousness"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Pattern"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Expectation"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Willingness"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Increment"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Law"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Intentionally_create"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Position_on_a_scale"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Building_subparts"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Obviousness"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Pattern"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Expectation"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Willingness"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z12[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
