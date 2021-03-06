# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Political_locales","Exchange","Organization","Appeal","Calendric_unit","Leadership","Statement","Capability","Process_continue","Relational_quantity","Leadership","Political_locales","Foreign_or_domestic_country"};
set Roles[Frames] :=  <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Exchange"> {"Theme_2","Place","Period_of_iterations","Manner","Exchangers","Time","Themes","Frequency","Exchanger_2","Exchanger_1","Theme_1"}, <"Organization"> {"Period_of_existence","Members","Place","Name","Container_possessor","Organization","Purpose","Descriptor"}, <"Appeal"> {"Grounds","Convict","Court","Decision","Representative"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Process_continue"> {"Duration","Place","Manner","Time","Circumstances","Depictive","Event","Concessive"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"};
set Spans := {"-1_-1","0_0","0_38","0_8","10_10","11_11","11_37","12_12","12_23","12_33","12_37","13_13","13_15","13_16","13_23","14_14","15_15","16_16","16_23","17_17","17_23","18_18","18_23","19_19","19_20","19_23","1_1","1_3","20_20","20_23","21_21","21_23","22_22","22_23","23_23","24_24","25_25","25_32","26_26","26_32","27_27","27_28","27_32","28_28","29_29","29_32","2_2","30_30","30_32","31_31","31_32","32_32","33_33","34_34","34_37","35_35","35_37","36_36","36_37","37_37","38_38","3_3","4_4","4_5","4_6","5_5","5_6","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Political_locales"]] binary;
var z1[Assignment["Exchange"]] binary;
var z2[Assignment["Organization"]] binary;
var z3[Assignment["Appeal"]] binary;
var z4[Assignment["Calendric_unit"]] binary;
var z5[Assignment["Leadership"]] binary;
var z6[Assignment["Statement"]] binary;
var z7[Assignment["Capability"]] binary;
var z8[Assignment["Process_continue"]] binary;
var z9[Assignment["Relational_quantity"]] binary;
var z10[Assignment["Leadership"]] binary;
var z11[Assignment["Political_locales"]] binary;
var z12[Assignment["Foreign_or_domestic_country"]] binary;
param probabilities0[Assignment["Political_locales"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Exchange"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Organization"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Appeal"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Calendric_unit"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Leadership"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Statement"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Capability"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Process_continue"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Relational_quantity"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Leadership"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Political_locales"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Political_locales"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Exchange"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Organization"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Appeal"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Process_continue"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities12[r,s] * z12[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 38};
set G[I] := <0> {"0_0","0_38","0_8"}, <1> {"0_38","0_8","1_1","1_3"}, <2> {"0_38","0_8","1_3","2_2"}, <3> {"0_38","0_8","1_3","3_3"}, <4> {"0_38","0_8","4_4","4_5","4_6"}, <5> {"0_38","0_8","4_5","4_6","5_5","5_6"}, <6> {"0_38","0_8","4_6","5_6","6_6"}, <7> {"0_38","0_8","7_7"}, <8> {"0_38","0_8","8_8"}, <9> {"0_38","9_9"}, <10> {"0_38","10_10"}, <11> {"0_38","11_11","11_37"}, <12> {"0_38","11_37","12_12","12_23","12_33","12_37"}, <13> {"0_38","11_37","12_23","12_33","12_37","13_13","13_15","13_16","13_23"}, <14> {"0_38","11_37","12_23","12_33","12_37","13_15","13_16","13_23","14_14"}, <15> {"0_38","11_37","12_23","12_33","12_37","13_15","13_16","13_23","15_15"}, <16> {"0_38","11_37","12_23","12_33","12_37","13_16","13_23","16_16","16_23"}, <17> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_17","17_23"}, <18> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_18","18_23"}, <19> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_23","19_19","19_20","19_23"}, <20> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_23","19_20","19_23","20_20","20_23"}, <21> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_23","19_23","20_23","21_21","21_23"}, <22> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_23","19_23","20_23","21_23","22_22","22_23"}, <23> {"0_38","11_37","12_23","12_33","12_37","13_23","16_23","17_23","18_23","19_23","20_23","21_23","22_23","23_23"}, <24> {"0_38","11_37","12_33","12_37","24_24"}, <25> {"0_38","11_37","12_33","12_37","25_25","25_32"}, <26> {"0_38","11_37","12_33","12_37","25_32","26_26","26_32"}, <27> {"0_38","11_37","12_33","12_37","25_32","26_32","27_27","27_28","27_32"}, <28> {"0_38","11_37","12_33","12_37","25_32","26_32","27_28","27_32","28_28"}, <29> {"0_38","11_37","12_33","12_37","25_32","26_32","27_32","29_29","29_32"}, <30> {"0_38","11_37","12_33","12_37","25_32","26_32","27_32","29_32","30_30","30_32"}, <31> {"0_38","11_37","12_33","12_37","25_32","26_32","27_32","29_32","30_32","31_31","31_32"}, <32> {"0_38","11_37","12_33","12_37","25_32","26_32","27_32","29_32","30_32","31_32","32_32"}, <33> {"0_38","11_37","12_33","12_37","33_33"}, <34> {"0_38","11_37","12_37","34_34","34_37"}, <35> {"0_38","11_37","12_37","34_37","35_35","35_37"}, <36> {"0_38","11_37","12_37","34_37","35_37","36_36","36_37"}, <37> {"0_38","11_37","12_37","34_37","35_37","36_37","37_37"}, <38> {"0_38","38_38"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Exchange"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Organization"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Appeal"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Process_continue"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Exchange"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Organization"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Appeal"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Leadership"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Statement"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Capability"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Process_continue"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Leadership"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z12[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Theme_2","Themes">,<"Theme_1","Themes">,<"Exchanger_2","Exchangers">,<"Exchanger_1","Exchangers">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr1 := {<"Exchanger_1","Exchanger_2">,<"Theme_1","Theme_2">,<"Exchangers","Themes">};
subto require1: forall <ri,rj> in Reqr1 do z1[ri,"-1_-1"] - z1[rj,"-1_-1"] == 0;
