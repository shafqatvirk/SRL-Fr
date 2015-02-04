# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Locale_by_use","Lively_place","Stage_of_progress","Origin","Political_locales","Being_located","Cardinal_numbers","Measure_duration","Individual_history","History","Presence","Locative_relation","Aesthetics","Locale_by_use","Ammunition","Leadership"};
set Roles[Frames] :=  <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Lively_place"> {"Duration","Place","Degree","Manner","Explanation","Individuals","Time","Circumstances","Location","Activity"}, <"Stage_of_progress"> {"Degree","Entity"}, <"Origin"> {"Entity","Origin"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Being_located"> {"Cotheme","Location","Theme","Time","Place"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Measure_duration"> {"Agent","Count","Unit","Process"}, <"Individual_history"> {"Time","Start_time","End_time","Participant","Events","Time_span","Domain"}, <"History"> {"Duration","Topic"}, <"Presence"> {"Location","Entity"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Aesthetics"> {"Time","Entity","Attribute","Place","Judge","Circumstances","Degree"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Ammunition"> {"Use","Ammunition","Type"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"};
set Spans := {"-1_-1","0_0","0_32","0_5","10_10","11_11","11_12","12_12","13_13","14_14","14_17","15_15","15_17","16_16","17_17","18_18","19_19","19_31","1_1","20_20","20_22","21_21","22_22","23_23","23_31","24_24","24_26","24_31","25_25","26_26","27_27","27_31","28_28","28_31","29_29","2_2","30_30","31_31","32_32","3_3","4_4","5_5","6_32","6_6","7_12","7_7","8_10","8_12","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Locale_by_use"]] binary;
var z1[Assignment["Lively_place"]] binary;
var z2[Assignment["Stage_of_progress"]] binary;
var z3[Assignment["Origin"]] binary;
var z4[Assignment["Political_locales"]] binary;
var z5[Assignment["Being_located"]] binary;
var z6[Assignment["Cardinal_numbers"]] binary;
var z7[Assignment["Measure_duration"]] binary;
var z8[Assignment["Individual_history"]] binary;
var z9[Assignment["History"]] binary;
var z10[Assignment["Presence"]] binary;
var z11[Assignment["Locative_relation"]] binary;
var z12[Assignment["Aesthetics"]] binary;
var z13[Assignment["Locale_by_use"]] binary;
var z14[Assignment["Ammunition"]] binary;
var z15[Assignment["Leadership"]] binary;
param probabilities0[Assignment["Locale_by_use"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Lively_place"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Stage_of_progress"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Origin"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Political_locales"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Being_located"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Cardinal_numbers"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Measure_duration"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Individual_history"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["History"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Presence"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Locative_relation"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Aesthetics"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Locale_by_use"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Ammunition"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Leadership"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Locale_by_use"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Lively_place"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Stage_of_progress"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Being_located"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Measure_duration"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Individual_history"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["History"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Presence"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Aesthetics"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Ammunition"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities15[r,s] * z15[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 32};
set G[I] := <0> {"0_0","0_32","0_5"}, <1> {"0_32","0_5","1_1"}, <2> {"0_32","0_5","2_2"}, <3> {"0_32","0_5","3_3"}, <4> {"0_32","0_5","4_4"}, <5> {"0_32","0_5","5_5"}, <6> {"0_32","6_32","6_6"}, <7> {"0_32","6_32","7_12","7_7"}, <8> {"0_32","6_32","7_12","8_10","8_12","8_8"}, <9> {"0_32","6_32","7_12","8_10","8_12","9_9"}, <10> {"0_32","10_10","6_32","7_12","8_10","8_12"}, <11> {"0_32","11_11","11_12","6_32","7_12","8_12"}, <12> {"0_32","11_12","12_12","6_32","7_12","8_12"}, <13> {"0_32","13_13","6_32"}, <14> {"0_32","14_14","14_17","6_32"}, <15> {"0_32","14_17","15_15","15_17","6_32"}, <16> {"0_32","14_17","15_17","16_16","6_32"}, <17> {"0_32","14_17","15_17","17_17","6_32"}, <18> {"0_32","18_18","6_32"}, <19> {"0_32","19_19","19_31","6_32"}, <20> {"0_32","19_31","20_20","20_22","6_32"}, <21> {"0_32","19_31","20_22","21_21","6_32"}, <22> {"0_32","19_31","20_22","22_22","6_32"}, <23> {"0_32","19_31","23_23","23_31","6_32"}, <24> {"0_32","19_31","23_31","24_24","24_26","24_31","6_32"}, <25> {"0_32","19_31","23_31","24_26","24_31","25_25","6_32"}, <26> {"0_32","19_31","23_31","24_26","24_31","26_26","6_32"}, <27> {"0_32","19_31","23_31","24_31","27_27","27_31","6_32"}, <28> {"0_32","19_31","23_31","24_31","27_31","28_28","28_31","6_32"}, <29> {"0_32","19_31","23_31","24_31","27_31","28_31","29_29","6_32"}, <30> {"0_32","19_31","23_31","24_31","27_31","28_31","30_30","6_32"}, <31> {"0_32","19_31","23_31","24_31","27_31","28_31","31_31","6_32"}, <32> {"0_32","32_32","6_32"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Lively_place"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Stage_of_progress"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Being_located"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Individual_history"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["History"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Presence"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Aesthetics"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Ammunition"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Lively_place"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Stage_of_progress"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Origin"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Being_located"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Individual_history"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["History"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Presence"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Aesthetics"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Ammunition"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Leadership"] do sum <s> in Spans : z15[r,s] == 1;
#pairwise exclusion constraint
set Exc11 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion11: forall <ri,rj> in Exc11 do z11[ri,"-1_-1"] + z11[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
