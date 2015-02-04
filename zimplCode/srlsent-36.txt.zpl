# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Expertise","Coming_to_believe","Likelihood","Temporal_collocation","Being_named","Similarity","Temporal_collocation","Simple_name"};
set Roles[Frames] :=  <"Expertise"> {"Skill","Knowledge","Degree","Manner","Behavior_product","Time","Protagonist","Role","Focal_participant"}, <"Coming_to_believe"> {"Cognizer","Topic","Content","Manner","Time","Means","Medium","Degree","Evidence"}, <"Likelihood"> {"Time","Place","Circumstances","Reason","Hypothetical_event","Degree"}, <"Temporal_collocation"> {"Event_description","Landmark_period","Trajector_entity","Landmark_entity","Landmark_event","Trajector_period","Trajector_event"}, <"Being_named"> {"Name","Speaker","Type","Name_source","Entity"}, <"Similarity"> {"Circumstances","Time","Place","Degree","Entities","Cause","Depictive","Entity_2","Entity_1","Manner","Differentiating_fact","Dimension"}, <"Temporal_collocation"> {"Event_description","Landmark_period","Trajector_entity","Landmark_entity","Landmark_event","Trajector_period","Trajector_event"}, <"Simple_name"> {"Speaker","Entity","Term"};
set Spans := {"-1_-1","0_0","0_34","10_10","11_11","11_12","12_12","13_13","14_14","14_33","15_15","15_16","15_17","15_33","16_16","17_17","17_33","18_18","18_33","19_19","1_1","1_34","20_20","21_21","22_22","23_23","24_24","24_31","25_25","26_26","27_27","28_28","28_31","29_29","2_2","2_33","30_30","31_31","32_32","33_33","34_34","3_3","3_33","3_4","4_33","4_4","5_33","5_5","6_33","6_6","7_10","7_12","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Expertise"]] binary;
var z1[Assignment["Coming_to_believe"]] binary;
var z2[Assignment["Likelihood"]] binary;
var z3[Assignment["Temporal_collocation"]] binary;
var z4[Assignment["Being_named"]] binary;
var z5[Assignment["Similarity"]] binary;
var z6[Assignment["Temporal_collocation"]] binary;
var z7[Assignment["Simple_name"]] binary;
param probabilities0[Assignment["Expertise"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Coming_to_believe"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Likelihood"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Temporal_collocation"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Being_named"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Similarity"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Temporal_collocation"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Simple_name"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Expertise"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Coming_to_believe"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Likelihood"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Temporal_collocation"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Being_named"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Similarity"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Temporal_collocation"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Simple_name"] : probabilities7[r,s] * z7[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 34};
set G[I] := <0> {"0_0","0_34"}, <1> {"0_34","1_1","1_34"}, <2> {"0_34","1_34","2_2","2_33"}, <3> {"0_34","1_34","2_33","3_3","3_33","3_4"}, <4> {"0_34","1_34","2_33","3_33","3_4","4_33","4_4"}, <5> {"0_34","1_34","2_33","3_33","4_33","5_33","5_5"}, <6> {"0_34","1_34","2_33","3_33","4_33","5_33","6_33","6_6"}, <7> {"0_34","1_34","2_33","3_33","4_33","5_33","6_33","7_10","7_12","7_7"}, <8> {"0_34","1_34","2_33","3_33","4_33","5_33","6_33","7_10","7_12","8_8"}, <9> {"0_34","1_34","2_33","3_33","4_33","5_33","6_33","7_10","7_12","9_9"}, <10> {"0_34","10_10","1_34","2_33","3_33","4_33","5_33","6_33","7_10","7_12"}, <11> {"0_34","11_11","11_12","1_34","2_33","3_33","4_33","5_33","6_33","7_12"}, <12> {"0_34","11_12","12_12","1_34","2_33","3_33","4_33","5_33","6_33","7_12"}, <13> {"0_34","13_13","1_34","2_33","3_33","4_33","5_33","6_33"}, <14> {"0_34","14_14","14_33","1_34","2_33","3_33","4_33","5_33","6_33"}, <15> {"0_34","14_33","15_15","15_16","15_17","15_33","1_34","2_33","3_33","4_33","5_33","6_33"}, <16> {"0_34","14_33","15_16","15_17","15_33","16_16","1_34","2_33","3_33","4_33","5_33","6_33"}, <17> {"0_34","14_33","15_17","15_33","17_17","17_33","1_34","2_33","3_33","4_33","5_33","6_33"}, <18> {"0_34","14_33","15_33","17_33","18_18","18_33","1_34","2_33","3_33","4_33","5_33","6_33"}, <19> {"0_34","14_33","15_33","17_33","18_33","19_19","1_34","2_33","3_33","4_33","5_33","6_33"}, <20> {"0_34","14_33","15_33","17_33","18_33","1_34","20_20","2_33","3_33","4_33","5_33","6_33"}, <21> {"0_34","14_33","15_33","17_33","18_33","1_34","21_21","2_33","3_33","4_33","5_33","6_33"}, <22> {"0_34","14_33","15_33","17_33","18_33","1_34","22_22","2_33","3_33","4_33","5_33","6_33"}, <23> {"0_34","14_33","15_33","17_33","18_33","1_34","23_23","2_33","3_33","4_33","5_33","6_33"}, <24> {"0_34","14_33","15_33","17_33","18_33","1_34","24_24","24_31","2_33","3_33","4_33","5_33","6_33"}, <25> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","25_25","2_33","3_33","4_33","5_33","6_33"}, <26> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","26_26","2_33","3_33","4_33","5_33","6_33"}, <27> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","27_27","2_33","3_33","4_33","5_33","6_33"}, <28> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","28_28","28_31","2_33","3_33","4_33","5_33","6_33"}, <29> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","28_31","29_29","2_33","3_33","4_33","5_33","6_33"}, <30> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","28_31","2_33","30_30","3_33","4_33","5_33","6_33"}, <31> {"0_34","14_33","15_33","17_33","18_33","1_34","24_31","28_31","2_33","31_31","3_33","4_33","5_33","6_33"}, <32> {"0_34","14_33","15_33","17_33","18_33","1_34","2_33","32_32","3_33","4_33","5_33","6_33"}, <33> {"0_34","14_33","15_33","17_33","18_33","1_34","2_33","33_33","3_33","4_33","5_33","6_33"}, <34> {"0_34","1_34","34_34"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Expertise"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Coming_to_believe"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Likelihood"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Temporal_collocation"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Being_named"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Similarity"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Temporal_collocation"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Simple_name"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Expertise"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Coming_to_believe"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Likelihood"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Temporal_collocation"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Being_named"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Similarity"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Temporal_collocation"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Simple_name"] do sum <s> in Spans : z7[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Behavior_product","Knowledge">,<"Behavior_product","Role">,<"Behavior_product","Focal_participant">,<"Behavior_product","Skill">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc3 := {<"Trajector_event","Trajector_period">,<"Landmark_entity","Landmark_event">,<"Landmark_event","Landmark_period">,<"Trajector_entity","Trajector_event">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc5 := {<"Entities","Entity_1">,<"Entities","Entity_2">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc6 := {<"Trajector_event","Trajector_period">,<"Landmark_entity","Landmark_event">,<"Landmark_event","Landmark_period">,<"Trajector_entity","Trajector_event">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr5 := {<"Entity_1","Entity_2">};
subto require5: forall <ri,rj> in Reqr5 do z5[ri,"-1_-1"] - z5[rj,"-1_-1"] == 0;
