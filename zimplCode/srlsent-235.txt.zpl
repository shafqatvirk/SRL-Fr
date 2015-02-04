# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Supply","Weapon","Locale_by_use","Artifact","Quantity","Political_locales","Temporal_subregion","Inclusion","Coming_up_with","Information","Nuclear_process","Substance","Unattributed_information","Assistance","Cause_to_make_progress"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Temporal_subregion"> {"Time_period","Time","Degree","Sub_part"}, <"Inclusion"> {"Purpose","Total","Contrast_set","Subregion","Frequency","Part"}, <"Coming_up_with"> {"Place","Cognizer","Result","Location_of_appearance","Idea","Manner","Means","Material","Purpose","Amount_of_progress"}, <"Information"> {"Means_of_Gathering","Source","Topic","Information","Cognizer"}, <"Nuclear_process"> {"Time","Final_element","Place","Manner","Element","Degree"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Unattributed_information"> {"Reported_fact","Time","Explanation","Duration"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Cause_to_make_progress"> {"Purpose","Time","Place","Degree","Rate","Means","Domain","Duration","Particular_iteration","Project","Post_state","Manner","Explanation","Agent","Prior_state"};
set Spans := {"-1_-1","0_0","0_29","10_10","10_11","10_14","11_11","12_12","13_13","14_14","15_15","16_16","16_28","17_17","17_18","17_21","17_28","18_18","19_19","1_1","1_29","20_20","21_21","22_22","22_28","23_23","23_24","23_28","24_24","24_28","25_25","25_26","25_28","26_26","26_28","27_27","27_28","28_28","29_29","2_2","2_3","2_5","3_3","4_4","5_5","6_28","6_6","7_28","7_7","8_8","9_14","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Supply"]] binary;
var z2[Assignment["Weapon"]] binary;
var z3[Assignment["Locale_by_use"]] binary;
var z4[Assignment["Artifact"]] binary;
var z5[Assignment["Quantity"]] binary;
var z6[Assignment["Political_locales"]] binary;
var z7[Assignment["Temporal_subregion"]] binary;
var z8[Assignment["Inclusion"]] binary;
var z9[Assignment["Coming_up_with"]] binary;
var z10[Assignment["Information"]] binary;
var z11[Assignment["Nuclear_process"]] binary;
var z12[Assignment["Substance"]] binary;
var z13[Assignment["Unattributed_information"]] binary;
var z14[Assignment["Assistance"]] binary;
var z15[Assignment["Cause_to_make_progress"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Supply"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Weapon"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Locale_by_use"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Artifact"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Quantity"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Political_locales"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Temporal_subregion"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Inclusion"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Coming_up_with"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Information"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Nuclear_process"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Substance"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Unattributed_information"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Assistance"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Cause_to_make_progress"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Temporal_subregion"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Inclusion"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Coming_up_with"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Information"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Nuclear_process"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Unattributed_information"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Cause_to_make_progress"] : probabilities15[r,s] * z15[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 29};
set G[I] := <0> {"0_0","0_29"}, <1> {"0_29","1_1","1_29"}, <2> {"0_29","1_29","2_2","2_3","2_5"}, <3> {"0_29","1_29","2_3","2_5","3_3"}, <4> {"0_29","1_29","2_5","4_4"}, <5> {"0_29","1_29","2_5","5_5"}, <6> {"0_29","1_29","6_28","6_6"}, <7> {"0_29","1_29","6_28","7_28","7_7"}, <8> {"0_29","1_29","6_28","7_28","8_8"}, <9> {"0_29","1_29","6_28","7_28","9_14","9_9"}, <10> {"0_29","10_10","10_11","10_14","1_29","6_28","7_28","9_14"}, <11> {"0_29","10_11","10_14","11_11","1_29","6_28","7_28","9_14"}, <12> {"0_29","10_14","12_12","1_29","6_28","7_28","9_14"}, <13> {"0_29","10_14","13_13","1_29","6_28","7_28","9_14"}, <14> {"0_29","10_14","14_14","1_29","6_28","7_28","9_14"}, <15> {"0_29","15_15","1_29","6_28","7_28"}, <16> {"0_29","16_16","16_28","1_29","6_28","7_28"}, <17> {"0_29","16_28","17_17","17_18","17_21","17_28","1_29","6_28","7_28"}, <18> {"0_29","16_28","17_18","17_21","17_28","18_18","1_29","6_28","7_28"}, <19> {"0_29","16_28","17_21","17_28","19_19","1_29","6_28","7_28"}, <20> {"0_29","16_28","17_21","17_28","1_29","20_20","6_28","7_28"}, <21> {"0_29","16_28","17_21","17_28","1_29","21_21","6_28","7_28"}, <22> {"0_29","16_28","17_28","1_29","22_22","22_28","6_28","7_28"}, <23> {"0_29","16_28","17_28","1_29","22_28","23_23","23_24","23_28","6_28","7_28"}, <24> {"0_29","16_28","17_28","1_29","22_28","23_24","23_28","24_24","24_28","6_28","7_28"}, <25> {"0_29","16_28","17_28","1_29","22_28","23_28","24_28","25_25","25_26","25_28","6_28","7_28"}, <26> {"0_29","16_28","17_28","1_29","22_28","23_28","24_28","25_26","25_28","26_26","26_28","6_28","7_28"}, <27> {"0_29","16_28","17_28","1_29","22_28","23_28","24_28","25_28","26_28","27_27","27_28","6_28","7_28"}, <28> {"0_29","16_28","17_28","1_29","22_28","23_28","24_28","25_28","26_28","27_28","28_28","6_28","7_28"}, <29> {"0_29","1_29","29_29"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Temporal_subregion"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Inclusion"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Coming_up_with"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Information"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Nuclear_process"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Unattributed_information"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Cause_to_make_progress"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Supply"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Weapon"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Artifact"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Quantity"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Temporal_subregion"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Inclusion"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Coming_up_with"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Information"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Nuclear_process"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Substance"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Unattributed_information"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Assistance"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Cause_to_make_progress"] do sum <s> in Spans : z15[r,s] == 1;
#pairwise exclusion constraint
set Exc5 := {<"Individuals","Mass">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
#pairwise requirement constraint