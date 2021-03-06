# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Locale_by_use","Part_inner_outer","Protecting","Architectural_part","People","Protecting","Social_connection","Locale","Locative_relation","Locale","Protecting","Protecting","Noise_makers","Gizmo","Calendric_unit","Gizmo"};
set Roles[Frames] :=  <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Part_inner_outer"> {"Part_Prop","Part","Whole"}, <"Protecting"> {"Protection","Time","Descriptor","Instrument","Place","Degree","Asset","Means","Depictive","Danger","Duration","Beneficiary","Manner","Explanation"}, <"Architectural_part"> {"Part","Whole","Descriptor","Material","Orientation"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Protecting"> {"Protection","Time","Descriptor","Instrument","Place","Degree","Asset","Means","Depictive","Danger","Duration","Beneficiary","Manner","Explanation"}, <"Social_connection"> {"Type","Degree","Connection","Individual2","Individual1"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"}, <"Protecting"> {"Protection","Time","Descriptor","Instrument","Place","Degree","Asset","Means","Depictive","Danger","Duration","Beneficiary","Manner","Explanation"}, <"Protecting"> {"Protection","Time","Descriptor","Instrument","Place","Degree","Asset","Means","Depictive","Danger","Duration","Beneficiary","Manner","Explanation"}, <"Noise_makers"> {"Name","Type","Material","Use","Noise_maker"}, <"Gizmo"> {"Descriptor","Power_source","Gizmo","Use","User"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Gizmo"> {"Descriptor","Power_source","Gizmo","Use","User"};
set Spans := {"-1_-1","0_0","0_2","0_46","0_48","10_10","10_11","11_11","12_12","13_13","14_14","15_15","16_16","17_17","18_18","18_21","19_19","19_21","1_1","20_20","20_21","21_21","22_22","23_23","23_37","24_24","24_37","25_25","25_37","26_26","26_34","26_37","27_27","28_28","28_31","29_29","2_2","30_30","31_31","32_32","33_33","34_34","35_35","36_36","37_37","38_38","39_39","3_3","40_40","41_41","41_42","42_42","43_43","44_44","45_45","46_46","47_47","47_48","48_48","4_12","4_15","4_4","4_6","5_5","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Locale_by_use"]] binary;
var z1[Assignment["Part_inner_outer"]] binary;
var z2[Assignment["Protecting"]] binary;
var z3[Assignment["Architectural_part"]] binary;
var z4[Assignment["People"]] binary;
var z5[Assignment["Protecting"]] binary;
var z6[Assignment["Social_connection"]] binary;
var z7[Assignment["Locale"]] binary;
var z8[Assignment["Locative_relation"]] binary;
var z9[Assignment["Locale"]] binary;
var z10[Assignment["Protecting"]] binary;
var z11[Assignment["Protecting"]] binary;
var z12[Assignment["Noise_makers"]] binary;
var z13[Assignment["Gizmo"]] binary;
var z14[Assignment["Calendric_unit"]] binary;
var z15[Assignment["Gizmo"]] binary;
param probabilities0[Assignment["Locale_by_use"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Part_inner_outer"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Protecting"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Architectural_part"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["People"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Protecting"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Social_connection"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Locale"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Locative_relation"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Locale"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Protecting"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Protecting"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Noise_makers"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Gizmo"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Calendric_unit"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Gizmo"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Locale_by_use"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Part_inner_outer"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Protecting"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Architectural_part"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["People"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Protecting"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Social_connection"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Protecting"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Protecting"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Noise_makers"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Gizmo"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Gizmo"] : probabilities15[r,s] * z15[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 48};
set G[I] := <0> {"0_0","0_2","0_46","0_48"}, <1> {"0_2","0_46","0_48","1_1"}, <2> {"0_2","0_46","0_48","2_2"}, <3> {"0_46","0_48","3_3"}, <4> {"0_46","0_48","4_12","4_15","4_4","4_6"}, <5> {"0_46","0_48","4_12","4_15","4_6","5_5"}, <6> {"0_46","0_48","4_12","4_15","4_6","6_6"}, <7> {"0_46","0_48","4_12","4_15","7_7"}, <8> {"0_46","0_48","4_12","4_15","8_8"}, <9> {"0_46","0_48","4_12","4_15","9_9"}, <10> {"0_46","0_48","10_10","10_11","4_12","4_15"}, <11> {"0_46","0_48","10_11","11_11","4_12","4_15"}, <12> {"0_46","0_48","12_12","4_12","4_15"}, <13> {"0_46","0_48","13_13","4_15"}, <14> {"0_46","0_48","14_14","4_15"}, <15> {"0_46","0_48","15_15","4_15"}, <16> {"0_46","0_48","16_16"}, <17> {"0_46","0_48","17_17"}, <18> {"0_46","0_48","18_18","18_21"}, <19> {"0_46","0_48","18_21","19_19","19_21"}, <20> {"0_46","0_48","18_21","19_21","20_20","20_21"}, <21> {"0_46","0_48","18_21","19_21","20_21","21_21"}, <22> {"0_46","0_48","22_22"}, <23> {"0_46","0_48","23_23","23_37"}, <24> {"0_46","0_48","23_37","24_24","24_37"}, <25> {"0_46","0_48","23_37","24_37","25_25","25_37"}, <26> {"0_46","0_48","23_37","24_37","25_37","26_26","26_34","26_37"}, <27> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","27_27"}, <28> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","28_28","28_31"}, <29> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","28_31","29_29"}, <30> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","28_31","30_30"}, <31> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","28_31","31_31"}, <32> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","32_32"}, <33> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","33_33"}, <34> {"0_46","0_48","23_37","24_37","25_37","26_34","26_37","34_34"}, <35> {"0_46","0_48","23_37","24_37","25_37","26_37","35_35"}, <36> {"0_46","0_48","23_37","24_37","25_37","26_37","36_36"}, <37> {"0_46","0_48","23_37","24_37","25_37","26_37","37_37"}, <38> {"0_46","0_48","38_38"}, <39> {"0_46","0_48","39_39"}, <40> {"0_46","0_48","40_40"}, <41> {"0_46","0_48","41_41","41_42"}, <42> {"0_46","0_48","41_42","42_42"}, <43> {"0_46","0_48","43_43"}, <44> {"0_46","0_48","44_44"}, <45> {"0_46","0_48","45_45"}, <46> {"0_46","0_48","46_46"}, <47> {"0_48","47_47","47_48"}, <48> {"0_48","47_48","48_48"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Part_inner_outer"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Protecting"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Architectural_part"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Protecting"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Social_connection"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Protecting"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Protecting"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Noise_makers"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Gizmo"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Gizmo"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Part_inner_outer"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Protecting"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Architectural_part"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["People"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Protecting"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Social_connection"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Locale"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Locale"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Protecting"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Protecting"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Noise_makers"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Gizmo"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Gizmo"] do sum <s> in Spans : z15[r,s] == 1;
#pairwise exclusion constraint
set Exc8 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr6 := {<"Individual1","Individual2">};
subto require6: forall <ri,rj> in Reqr6 do z6[ri,"-1_-1"] - z6[rj,"-1_-1"] == 0;
