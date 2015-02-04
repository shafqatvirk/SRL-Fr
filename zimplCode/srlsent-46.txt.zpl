# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Measure_duration","Natural_features","Relational_quantity","Identicality","Political_locales","Existence","Calendric_unit","Cardinal_numbers","Presence","Natural_features","Fluidic_motion","Part_inner_outer","Quantity","Locale"};
set Roles[Frames] :=  <"Measure_duration"> {"Agent","Count","Unit","Process"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Identicality"> {"Type","Current_instance","Time","Previous_instance","Previous_context"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Existence"> {"Place","Duration","Inherent_purpose","Entity","Point_of_view","Time","Circumstances","State","Cause"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Presence"> {"Location","Entity"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Fluidic_motion"> {"Result","Fluid","Depictive","Distance","Configuration","Place","Area","Source","Cause","Path","Duration","Goal","Manner","Time","Speed"}, <"Part_inner_outer"> {"Part_Prop","Part","Whole"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_2","0_36","10_10","11_11","12_12","13_13","13_35","14_14","14_35","15_15","15_35","16_16","16_17","17_17","18_18","19_19","19_35","1_1","1_2","20_20","20_21","20_35","21_21","22_22","23_23","24_24","25_25","25_27","26_26","26_27","27_27","28_28","28_35","29_29","29_35","2_2","30_30","30_32","31_31","31_32","32_32","33_33","33_35","34_34","34_35","35_35","36_36","3_3","4_4","4_5","5_5","6_6","7_12","7_7","8_12","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Measure_duration"]] binary;
var z1[Assignment["Natural_features"]] binary;
var z2[Assignment["Relational_quantity"]] binary;
var z3[Assignment["Identicality"]] binary;
var z4[Assignment["Political_locales"]] binary;
var z5[Assignment["Existence"]] binary;
var z6[Assignment["Calendric_unit"]] binary;
var z7[Assignment["Cardinal_numbers"]] binary;
var z8[Assignment["Presence"]] binary;
var z9[Assignment["Natural_features"]] binary;
var z10[Assignment["Fluidic_motion"]] binary;
var z11[Assignment["Part_inner_outer"]] binary;
var z12[Assignment["Quantity"]] binary;
var z13[Assignment["Locale"]] binary;
param probabilities0[Assignment["Measure_duration"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Natural_features"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Relational_quantity"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Identicality"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Political_locales"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Existence"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Calendric_unit"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Cardinal_numbers"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Presence"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Natural_features"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Fluidic_motion"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Part_inner_outer"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Quantity"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Locale"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Measure_duration"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Identicality"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Existence"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Presence"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Fluidic_motion"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Part_inner_outer"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 36};
set G[I] := <0> {"0_0","0_2","0_36"}, <1> {"0_2","0_36","1_1","1_2"}, <2> {"0_2","0_36","1_2","2_2"}, <3> {"0_36","3_3"}, <4> {"0_36","4_4","4_5"}, <5> {"0_36","4_5","5_5"}, <6> {"0_36","6_6"}, <7> {"0_36","7_12","7_7"}, <8> {"0_36","7_12","8_12","8_8"}, <9> {"0_36","7_12","8_12","9_9"}, <10> {"0_36","10_10","7_12","8_12"}, <11> {"0_36","11_11","7_12","8_12"}, <12> {"0_36","12_12","7_12","8_12"}, <13> {"0_36","13_13","13_35"}, <14> {"0_36","13_35","14_14","14_35"}, <15> {"0_36","13_35","14_35","15_15","15_35"}, <16> {"0_36","13_35","14_35","15_35","16_16","16_17"}, <17> {"0_36","13_35","14_35","15_35","16_17","17_17"}, <18> {"0_36","13_35","14_35","15_35","18_18"}, <19> {"0_36","13_35","14_35","15_35","19_19","19_35"}, <20> {"0_36","13_35","14_35","15_35","19_35","20_20","20_21","20_35"}, <21> {"0_36","13_35","14_35","15_35","19_35","20_21","20_35","21_21"}, <22> {"0_36","13_35","14_35","15_35","19_35","20_35","22_22"}, <23> {"0_36","13_35","14_35","15_35","19_35","20_35","23_23"}, <24> {"0_36","13_35","14_35","15_35","19_35","20_35","24_24"}, <25> {"0_36","13_35","14_35","15_35","19_35","20_35","25_25","25_27"}, <26> {"0_36","13_35","14_35","15_35","19_35","20_35","25_27","26_26","26_27"}, <27> {"0_36","13_35","14_35","15_35","19_35","20_35","25_27","26_27","27_27"}, <28> {"0_36","13_35","14_35","15_35","19_35","20_35","28_28","28_35"}, <29> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_29","29_35"}, <30> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","30_30","30_32"}, <31> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","30_32","31_31","31_32"}, <32> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","30_32","31_32","32_32"}, <33> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","33_33","33_35"}, <34> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","33_35","34_34","34_35"}, <35> {"0_36","13_35","14_35","15_35","19_35","20_35","28_35","29_35","33_35","34_35","35_35"}, <36> {"0_36","36_36"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Identicality"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Existence"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Presence"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Fluidic_motion"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Part_inner_outer"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Identicality"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Existence"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Presence"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Fluidic_motion"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Part_inner_outer"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Quantity"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Locale"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc10 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
set Exc12 := {<"Individuals","Mass">};
subto exclusion12: forall <ri,rj> in Exc12 do z12[ri,"-1_-1"] + z12[rj,"-1_-1"] >= 1;
#pairwise requirement constraint