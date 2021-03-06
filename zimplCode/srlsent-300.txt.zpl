# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Calendric_unit","Leadership","Secrecy_status","Statement","Commitment","Reveal_secret","Destroying","Weapon","Project","Political_locales","Relative_time","Frequency","Discussion","Leadership"};
set Roles[Frames] :=  <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Secrecy_status"> {"Time","Phenomenon","Degree","Epistemic_stance","Cognizer"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Commitment"> {"Addressee","Medium","Topic","Manner","Speaker","Time","Message","Purpose"}, <"Reveal_secret"> {"Medium","Place","Means","Depictive","Speaker","Location_of_protagonist","Manner","Completeness","Period_of_iterations","Information","Addressee","Time","Containing_event","Event_description","Frequency","Re-encoding","Internal_cause","Topic","Source_material"}, <"Destroying"> {"Purpose","Result","Undergoer","Depictive","Containing_event","Instrument","Place","Frequency","Degree","Destroyer","Means","Cause","Reason","Manner","Explanation","Time"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Project"> {"Salient_entity","Duration","Agent","Goal","Manner","Name","Project","Field","Descriptor","Activity"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Relative_time"> {"Focal_participant","Interval","Degree","Focal_occasion","Landmark_occasion"}, <"Frequency"> {"Time_span","Attribute","Degree","Time","Event","Interval","Rate","Salient_entity"}, <"Discussion"> {"Purpose","Topic","Depictive","Containing_event","Amount_of_discussion","Frequency","Means","Interlocutor_2","Interlocutor_1","Period_of_iterations","Means_of_communication","Domain","Duration","Place","Manner","Interlocutors","Time"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"};
set Spans := {"-1_-1","0_0","0_3","0_34","10_10","11_11","12_12","12_13","13_13","14_14","14_33","15_15","15_33","16_16","17_17","18_18","18_19","19_19","1_1","1_2","1_3","20_20","20_22","21_21","21_22","22_22","23_23","23_33","24_24","24_26","24_33","25_25","26_26","27_27","27_33","28_28","28_33","29_29","29_33","2_2","2_3","30_30","30_33","31_31","32_32","33_33","34_34","3_3","4_4","5_5","5_9","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Calendric_unit"]] binary;
var z1[Assignment["Leadership"]] binary;
var z2[Assignment["Secrecy_status"]] binary;
var z3[Assignment["Statement"]] binary;
var z4[Assignment["Commitment"]] binary;
var z5[Assignment["Reveal_secret"]] binary;
var z6[Assignment["Destroying"]] binary;
var z7[Assignment["Weapon"]] binary;
var z8[Assignment["Project"]] binary;
var z9[Assignment["Political_locales"]] binary;
var z10[Assignment["Relative_time"]] binary;
var z11[Assignment["Frequency"]] binary;
var z12[Assignment["Discussion"]] binary;
var z13[Assignment["Leadership"]] binary;
param probabilities0[Assignment["Calendric_unit"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Leadership"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Secrecy_status"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Statement"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Commitment"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Reveal_secret"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Destroying"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Weapon"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Project"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Political_locales"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Relative_time"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Frequency"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Discussion"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Leadership"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Calendric_unit"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Secrecy_status"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Commitment"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Reveal_secret"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Destroying"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Project"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Relative_time"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Frequency"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Discussion"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities13[r,s] * z13[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 34};
set G[I] := <0> {"0_0","0_3","0_34"}, <1> {"0_3","0_34","1_1","1_2","1_3"}, <2> {"0_3","0_34","1_2","1_3","2_2","2_3"}, <3> {"0_3","0_34","1_3","2_3","3_3"}, <4> {"0_34","4_4"}, <5> {"0_34","5_5","5_9"}, <6> {"0_34","5_9","6_6"}, <7> {"0_34","5_9","7_7"}, <8> {"0_34","5_9","8_8"}, <9> {"0_34","5_9","9_9"}, <10> {"0_34","10_10"}, <11> {"0_34","11_11"}, <12> {"0_34","12_12","12_13"}, <13> {"0_34","12_13","13_13"}, <14> {"0_34","14_14","14_33"}, <15> {"0_34","14_33","15_15","15_33"}, <16> {"0_34","14_33","15_33","16_16"}, <17> {"0_34","14_33","15_33","17_17"}, <18> {"0_34","14_33","15_33","18_18","18_19"}, <19> {"0_34","14_33","15_33","18_19","19_19"}, <20> {"0_34","14_33","15_33","20_20","20_22"}, <21> {"0_34","14_33","15_33","20_22","21_21","21_22"}, <22> {"0_34","14_33","15_33","20_22","21_22","22_22"}, <23> {"0_34","14_33","15_33","23_23","23_33"}, <24> {"0_34","14_33","15_33","23_33","24_24","24_26","24_33"}, <25> {"0_34","14_33","15_33","23_33","24_26","24_33","25_25"}, <26> {"0_34","14_33","15_33","23_33","24_26","24_33","26_26"}, <27> {"0_34","14_33","15_33","23_33","24_33","27_27","27_33"}, <28> {"0_34","14_33","15_33","23_33","24_33","27_33","28_28","28_33"}, <29> {"0_34","14_33","15_33","23_33","24_33","27_33","28_33","29_29","29_33"}, <30> {"0_34","14_33","15_33","23_33","24_33","27_33","28_33","29_33","30_30","30_33"}, <31> {"0_34","14_33","15_33","23_33","24_33","27_33","28_33","29_33","30_33","31_31"}, <32> {"0_34","14_33","15_33","23_33","24_33","27_33","28_33","29_33","30_33","32_32"}, <33> {"0_34","14_33","15_33","23_33","24_33","27_33","28_33","29_33","30_33","33_33"}, <34> {"0_34","34_34"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Secrecy_status"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Commitment"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Reveal_secret"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Destroying"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Project"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Relative_time"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Frequency"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Discussion"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Leadership"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Secrecy_status"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Statement"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Commitment"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Reveal_secret"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Destroying"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Weapon"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Project"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Relative_time"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Frequency"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Discussion"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Leadership"] do sum <s> in Spans : z13[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Cause","Destroyer">,<"Cause","Means">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc8 := {<"Activity","Salient_entity">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
set Exc11 := {<"Degree","Rate">,<"Interval","Salient_entity">,<"Event","Salient_entity">};
subto exclusion11: forall <ri,rj> in Exc11 do z11[ri,"-1_-1"] + z11[rj,"-1_-1"] >= 1;
set Exc12 := {<"Interlocutor_1","Interlocutors">,<"Interlocutor_2","Interlocutors">};
subto exclusion12: forall <ri,rj> in Exc12 do z12[ri,"-1_-1"] + z12[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr12 := {<"Interlocutor_1","Interlocutor_2">};
subto require12: forall <ri,rj> in Reqr12 do z12[ri,"-1_-1"] - z12[rj,"-1_-1"] == 0;
