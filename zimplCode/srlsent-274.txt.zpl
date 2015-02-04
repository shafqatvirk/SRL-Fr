# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Weapon","Weapon","Awareness","Assistance","Building","Locale_by_use","Locative_relation","People_by_vocation","Intentionally_act","Research","Using","Origin","Artifact","Manufacturing","Increment","Artifact"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Awareness"> {"Cognizer","Topic","Degree","Role","Manner","Evidence","Explanation","Time","Content","Expressor","Paradigm"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Building"> {"Purpose","Result","Components","Time","Descriptor","Instrument","Place","Created_entity","Means","Period_of_iterations","Particular_iteration","Duration","Beneficiary","Manner","Agent"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"People_by_vocation"> {"Type","Origin","Contract_basis","Ethnicity","Employer","Place_of_employment","Person","Descriptor","Rank","Compensation","Persistent_characteristic"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Research"> {"Type","Question","Place","Topic","Manner","Field","Time","Means","Purpose","Researcher","Population"}, <"Using"> {"Duration","Depictive","Purpose","Means","Role","Circumstances","Agent","Manner","Explanation","Outcome","Instrument","Time","Period_of_iterations","Containing_event","Degree","Place","Frequency","Group"}, <"Origin"> {"Entity","Origin"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"};
set Spans := {"-1_-1","0_0","0_31","10_10","10_13","10_30","11_11","12_12","13_13","14_14","14_30","15_15","15_30","16_16","16_30","17_17","18_18","18_24","19_19","19_24","1_1","1_31","20_20","20_24","21_21","22_22","23_23","24_24","25_25","26_26","26_30","27_27","27_30","28_28","29_29","2_2","2_30","30_30","31_31","3_3","3_30","3_4","4_30","4_4","5_30","5_5","6_30","6_6","7_30","7_7","7_8","8_8","9_30","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Weapon"]] binary;
var z2[Assignment["Weapon"]] binary;
var z3[Assignment["Awareness"]] binary;
var z4[Assignment["Assistance"]] binary;
var z5[Assignment["Building"]] binary;
var z6[Assignment["Locale_by_use"]] binary;
var z7[Assignment["Locative_relation"]] binary;
var z8[Assignment["People_by_vocation"]] binary;
var z9[Assignment["Intentionally_act"]] binary;
var z10[Assignment["Research"]] binary;
var z11[Assignment["Using"]] binary;
var z12[Assignment["Origin"]] binary;
var z13[Assignment["Artifact"]] binary;
var z14[Assignment["Manufacturing"]] binary;
var z15[Assignment["Increment"]] binary;
var z16[Assignment["Artifact"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Weapon"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Weapon"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Awareness"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Assistance"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Building"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Locale_by_use"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Locative_relation"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["People_by_vocation"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Intentionally_act"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Research"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Using"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Origin"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Artifact"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Manufacturing"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Increment"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Artifact"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Awareness"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Building"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["People_by_vocation"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Research"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Using"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities16[r,s] * z16[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 31};
set G[I] := <0> {"0_0","0_31"}, <1> {"0_31","1_1","1_31"}, <2> {"0_31","1_31","2_2","2_30"}, <3> {"0_31","1_31","2_30","3_3","3_30","3_4"}, <4> {"0_31","1_31","2_30","3_30","3_4","4_30","4_4"}, <5> {"0_31","1_31","2_30","3_30","4_30","5_30","5_5"}, <6> {"0_31","1_31","2_30","3_30","4_30","5_30","6_30","6_6"}, <7> {"0_31","1_31","2_30","3_30","4_30","5_30","6_30","7_30","7_7","7_8"}, <8> {"0_31","1_31","2_30","3_30","4_30","5_30","6_30","7_30","7_8","8_8"}, <9> {"0_31","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30","9_9"}, <10> {"0_31","10_10","10_13","10_30","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <11> {"0_31","10_13","10_30","11_11","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <12> {"0_31","10_13","10_30","12_12","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <13> {"0_31","10_13","10_30","13_13","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <14> {"0_31","10_30","14_14","14_30","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <15> {"0_31","10_30","14_30","15_15","15_30","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <16> {"0_31","10_30","14_30","15_30","16_16","16_30","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <17> {"0_31","10_30","14_30","15_30","16_30","17_17","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <18> {"0_31","10_30","14_30","15_30","16_30","18_18","18_24","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <19> {"0_31","10_30","14_30","15_30","16_30","18_24","19_19","19_24","1_31","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <20> {"0_31","10_30","14_30","15_30","16_30","18_24","19_24","1_31","20_20","20_24","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <21> {"0_31","10_30","14_30","15_30","16_30","18_24","19_24","1_31","20_24","21_21","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <22> {"0_31","10_30","14_30","15_30","16_30","18_24","19_24","1_31","20_24","22_22","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <23> {"0_31","10_30","14_30","15_30","16_30","18_24","19_24","1_31","20_24","23_23","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <24> {"0_31","10_30","14_30","15_30","16_30","18_24","19_24","1_31","20_24","24_24","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <25> {"0_31","10_30","14_30","15_30","16_30","1_31","25_25","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <26> {"0_31","10_30","14_30","15_30","16_30","1_31","26_26","26_30","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <27> {"0_31","10_30","14_30","15_30","16_30","1_31","26_30","27_27","27_30","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <28> {"0_31","10_30","14_30","15_30","16_30","1_31","26_30","27_30","28_28","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <29> {"0_31","10_30","14_30","15_30","16_30","1_31","26_30","27_30","29_29","2_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <30> {"0_31","10_30","14_30","15_30","16_30","1_31","26_30","27_30","2_30","30_30","3_30","4_30","5_30","6_30","7_30","9_30"}, <31> {"0_31","1_31","31_31"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Awareness"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Building"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["People_by_vocation"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Research"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Using"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Weapon"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Weapon"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Awareness"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Assistance"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Building"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["People_by_vocation"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Research"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Using"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Origin"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Artifact"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Increment"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Artifact"] do sum <s> in Spans : z16[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Cognizer","Expressor">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc7 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
