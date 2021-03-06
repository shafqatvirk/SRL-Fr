# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Activity_ongoing","Seeking_to_achieve","Importance","Manufacturing","Artifact","Education_teaching","Expertise","Gizmo","Substance","Entity","Capability","Using","Assistance","Arriving","Purpose","Indigenous_origin","Stimulus_focus","Active_substance","Manufacturing","Capability"};
set Roles[Frames] :=  <"Activity_ongoing"> {"Purpose","Circumstances","Depictive","Activity","Event_description","Duration","Manner","Time","Explanation","Means","Subevent","Agent"}, <"Seeking_to_achieve"> {"Purpose","Circumstances","State_of_affairs","Degree","Means","Source","Sought_entity","Depictive","Duration","Time","Beneficiary","Manner","Explanation","Agent"}, <"Importance"> {"Place","Undertaking","Explanation","Field","Time","Factor","Reason","Frequency","Degree","Interested_party"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Education_teaching"> {"Duration","Depictive","Purpose","Means","Role","Institution","Level","Manner","Result","Subject","Teacher","Course","Time","Material","Degree","Place","Skill","Qualification","Student","Fact","Precept"}, <"Expertise"> {"Skill","Knowledge","Degree","Manner","Behavior_product","Time","Protagonist","Role","Focal_participant"}, <"Gizmo"> {"Descriptor","Power_source","Gizmo","Use","User"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Entity"> {"Entity","Constituent_parts","Type"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Using"> {"Duration","Depictive","Purpose","Means","Role","Circumstances","Agent","Manner","Explanation","Outcome","Instrument","Time","Period_of_iterations","Containing_event","Degree","Place","Frequency","Group"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Purpose"> {"Attribute","Agent","Goal","Time","Restrictor","Value","Domain","Means"}, <"Indigenous_origin"> {"Entity","Origin"}, <"Stimulus_focus"> {"Stimulus","Parameter","Circumstances","Property","Experiencer","Comparison_set","Degree"}, <"Active_substance"> {"Name","Type","Substance","Descriptor","Effect"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"};
set Spans := {"-1_-1","0_0","0_40","10_10","11_11","12_12","13_13","14_14","15_15","15_20","16_16","16_20","17_17","17_20","18_18","18_20","19_19","1_1","1_40","20_20","21_21","21_39","22_22","22_39","23_23","23_39","24_24","24_39","25_25","25_26","25_39","26_26","26_39","27_27","27_28","27_39","28_28","28_39","29_29","29_31","29_39","2_2","2_3","2_39","30_30","31_31","32_32","32_39","33_33","33_39","34_34","35_35","36_36","37_37","38_38","39_39","3_3","3_39","40_40","4_39","4_4","4_6","5_5","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Activity_ongoing"]] binary;
var z1[Assignment["Seeking_to_achieve"]] binary;
var z2[Assignment["Importance"]] binary;
var z3[Assignment["Manufacturing"]] binary;
var z4[Assignment["Artifact"]] binary;
var z5[Assignment["Education_teaching"]] binary;
var z6[Assignment["Expertise"]] binary;
var z7[Assignment["Gizmo"]] binary;
var z8[Assignment["Substance"]] binary;
var z9[Assignment["Entity"]] binary;
var z10[Assignment["Capability"]] binary;
var z11[Assignment["Using"]] binary;
var z12[Assignment["Assistance"]] binary;
var z13[Assignment["Arriving"]] binary;
var z14[Assignment["Purpose"]] binary;
var z15[Assignment["Indigenous_origin"]] binary;
var z16[Assignment["Stimulus_focus"]] binary;
var z17[Assignment["Active_substance"]] binary;
var z18[Assignment["Manufacturing"]] binary;
var z19[Assignment["Capability"]] binary;
param probabilities0[Assignment["Activity_ongoing"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Seeking_to_achieve"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Importance"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Manufacturing"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Artifact"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Education_teaching"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Expertise"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Gizmo"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Substance"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Entity"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Capability"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Using"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Assistance"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Arriving"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Purpose"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Indigenous_origin"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Stimulus_focus"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Active_substance"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Manufacturing"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;
param probabilities19[Assignment["Capability"]] := read "../frameData/frame19.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Activity_ongoing"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Seeking_to_achieve"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Importance"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Education_teaching"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Expertise"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Gizmo"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Entity"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Using"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Purpose"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Indigenous_origin"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Stimulus_focus"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Active_substance"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities18[r,s] * z18[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities19[r,s] * z19[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 40};
set G[I] := <0> {"0_0","0_40"}, <1> {"0_40","1_1","1_40"}, <2> {"0_40","1_40","2_2","2_3","2_39"}, <3> {"0_40","1_40","2_3","2_39","3_3","3_39"}, <4> {"0_40","1_40","2_39","3_39","4_39","4_4","4_6"}, <5> {"0_40","1_40","2_39","3_39","4_39","4_6","5_5"}, <6> {"0_40","1_40","2_39","3_39","4_39","4_6","6_6"}, <7> {"0_40","1_40","2_39","3_39","4_39","7_7"}, <8> {"0_40","1_40","2_39","3_39","4_39","8_8"}, <9> {"0_40","1_40","2_39","3_39","4_39","9_9"}, <10> {"0_40","10_10","1_40","2_39","3_39","4_39"}, <11> {"0_40","11_11","1_40","2_39","3_39","4_39"}, <12> {"0_40","12_12","1_40","2_39","3_39","4_39"}, <13> {"0_40","13_13","1_40","2_39","3_39","4_39"}, <14> {"0_40","14_14","1_40","2_39","3_39","4_39"}, <15> {"0_40","15_15","15_20","1_40","2_39","3_39","4_39"}, <16> {"0_40","15_20","16_16","16_20","1_40","2_39","3_39","4_39"}, <17> {"0_40","15_20","16_20","17_17","17_20","1_40","2_39","3_39","4_39"}, <18> {"0_40","15_20","16_20","17_20","18_18","18_20","1_40","2_39","3_39","4_39"}, <19> {"0_40","15_20","16_20","17_20","18_20","19_19","1_40","2_39","3_39","4_39"}, <20> {"0_40","15_20","16_20","17_20","18_20","1_40","20_20","2_39","3_39","4_39"}, <21> {"0_40","1_40","21_21","21_39","2_39","3_39","4_39"}, <22> {"0_40","1_40","21_39","22_22","22_39","2_39","3_39","4_39"}, <23> {"0_40","1_40","21_39","22_39","23_23","23_39","2_39","3_39","4_39"}, <24> {"0_40","1_40","21_39","22_39","23_39","24_24","24_39","2_39","3_39","4_39"}, <25> {"0_40","1_40","21_39","22_39","23_39","24_39","25_25","25_26","25_39","2_39","3_39","4_39"}, <26> {"0_40","1_40","21_39","22_39","23_39","24_39","25_26","25_39","26_26","26_39","2_39","3_39","4_39"}, <27> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_27","27_28","27_39","2_39","3_39","4_39"}, <28> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_28","27_39","28_28","28_39","2_39","3_39","4_39"}, <29> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_29","29_31","29_39","2_39","3_39","4_39"}, <30> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_31","29_39","2_39","30_30","3_39","4_39"}, <31> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_31","29_39","2_39","31_31","3_39","4_39"}, <32> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_32","32_39","3_39","4_39"}, <33> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_33","33_39","3_39","4_39"}, <34> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","34_34","3_39","4_39"}, <35> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","35_35","3_39","4_39"}, <36> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","36_36","3_39","4_39"}, <37> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","37_37","3_39","4_39"}, <38> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","38_38","3_39","4_39"}, <39> {"0_40","1_40","21_39","22_39","23_39","24_39","25_39","26_39","27_39","28_39","29_39","2_39","32_39","33_39","39_39","3_39","4_39"}, <40> {"0_40","1_40","40_40"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Activity_ongoing"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Seeking_to_achieve"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Importance"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Education_teaching"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Expertise"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Gizmo"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Entity"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Using"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Purpose"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Indigenous_origin"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Stimulus_focus"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Active_substance"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
subto overlap19: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z19[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Activity_ongoing"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Seeking_to_achieve"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Importance"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Artifact"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Education_teaching"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Expertise"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Gizmo"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Substance"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Entity"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Capability"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Using"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Assistance"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Arriving"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Purpose"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Indigenous_origin"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Stimulus_focus"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Active_substance"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z18[r,s] == 1;
subto unique19: forall <r> in Roles["Capability"] do sum <s> in Spans : z19[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Sought_entity","State_of_affairs">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc2 := {<"Field","Interested_party">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
set Exc5 := {<"Precept","Subject">,<"Precept","Skill">,<"Skill","Subject">,<"Fact","Precept">,<"Fact","Qualification">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc6 := {<"Behavior_product","Knowledge">,<"Behavior_product","Role">,<"Behavior_product","Focal_participant">,<"Behavior_product","Skill">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc14 := {<"Attribute","Goal">,<"Goal","Value">};
subto exclusion14: forall <ri,rj> in Exc14 do z14[ri,"-1_-1"] + z14[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr14 := {<"Attribute","Value">};
subto require14: forall <ri,rj> in Reqr14 do z14[ri,"-1_-1"] - z14[rj,"-1_-1"] == 0;
