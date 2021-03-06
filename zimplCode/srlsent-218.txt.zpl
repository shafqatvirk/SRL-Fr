# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Buildings","Terrorism","Aggregate","Desirability","Emotion_directed","Possession","Buildings","Be_in_control","Means","Preventing","Organization","Active_substance","Quitting_a_place","Aggregate","Membership"};
set Roles[Frames] :=  <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Terrorism"> {"Place","Instrument","Terrorist","Victim","Act","Organization","Purpose","Descriptor"}, <"Aggregate"> {"Individuals","AggregateProperty","Aggregate","Name","Domain","Container_possessor"}, <"Desirability"> {"Parameter","Affected_party","Circumstances","Depictive","Comparison_set","Degree","Evaluee"}, <"Emotion_directed"> {"Topic","Circumstances","Parameter","Degree","Experiencer","Event","Expressor","Reason","Empathy_target","Manner","State","Stimulus","Frequency"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Be_in_control"> {"Time","Dependent_entity","Controlling_entity"}, <"Means"> {"Agent","Purpose","Descriptor","Time","Means"}, <"Preventing"> {"Degree","Place","Time","Event","Preventing_cause","Agent"}, <"Organization"> {"Period_of_existence","Members","Place","Name","Container_possessor","Organization","Purpose","Descriptor"}, <"Active_substance"> {"Name","Type","Substance","Descriptor","Effect"}, <"Quitting_a_place"> {"Source","Path","Manner","Co_participant","Direction","Time","Depictive","Distance","Purpose","Intended_goal","Self_mover"}, <"Aggregate"> {"Individuals","AggregateProperty","Aggregate","Name","Domain","Container_possessor"}, <"Membership"> {"Member","Standing","Group"};
set Spans := {"-1_-1","0_0","0_1","0_31","0_5","0_8","10_10","10_12","10_16","10_30","11_11","12_12","13_13","14_14","15_15","16_16","17_17","17_30","18_18","18_30","19_19","19_30","1_1","20_20","21_21","22_22","23_23","23_30","24_24","24_25","24_27","24_30","25_25","26_26","27_27","28_28","28_30","29_29","29_30","2_2","30_30","31_31","3_3","4_4","5_5","6_6","6_8","7_7","7_8","8_8","9_31","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Buildings"]] binary;
var z1[Assignment["Terrorism"]] binary;
var z2[Assignment["Aggregate"]] binary;
var z3[Assignment["Desirability"]] binary;
var z4[Assignment["Emotion_directed"]] binary;
var z5[Assignment["Possession"]] binary;
var z6[Assignment["Buildings"]] binary;
var z7[Assignment["Be_in_control"]] binary;
var z8[Assignment["Means"]] binary;
var z9[Assignment["Preventing"]] binary;
var z10[Assignment["Organization"]] binary;
var z11[Assignment["Active_substance"]] binary;
var z12[Assignment["Quitting_a_place"]] binary;
var z13[Assignment["Aggregate"]] binary;
var z14[Assignment["Membership"]] binary;
param probabilities0[Assignment["Buildings"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Terrorism"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Aggregate"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Desirability"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Emotion_directed"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Possession"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Buildings"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Be_in_control"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Means"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Preventing"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Organization"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Active_substance"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Quitting_a_place"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Aggregate"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Membership"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Buildings"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Terrorism"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Aggregate"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Desirability"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Emotion_directed"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Buildings"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Be_in_control"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Means"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Preventing"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Organization"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Active_substance"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Quitting_a_place"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Aggregate"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Membership"] : probabilities14[r,s] * z14[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 31};
set G[I] := <0> {"0_0","0_1","0_31","0_5","0_8"}, <1> {"0_1","0_31","0_5","0_8","1_1"}, <2> {"0_31","0_5","0_8","2_2"}, <3> {"0_31","0_5","0_8","3_3"}, <4> {"0_31","0_5","0_8","4_4"}, <5> {"0_31","0_5","0_8","5_5"}, <6> {"0_31","0_8","6_6","6_8"}, <7> {"0_31","0_8","6_8","7_7","7_8"}, <8> {"0_31","0_8","6_8","7_8","8_8"}, <9> {"0_31","9_31","9_9"}, <10> {"0_31","10_10","10_12","10_16","10_30","9_31"}, <11> {"0_31","10_12","10_16","10_30","11_11","9_31"}, <12> {"0_31","10_12","10_16","10_30","12_12","9_31"}, <13> {"0_31","10_16","10_30","13_13","9_31"}, <14> {"0_31","10_16","10_30","14_14","9_31"}, <15> {"0_31","10_16","10_30","15_15","9_31"}, <16> {"0_31","10_16","10_30","16_16","9_31"}, <17> {"0_31","10_30","17_17","17_30","9_31"}, <18> {"0_31","10_30","17_30","18_18","18_30","9_31"}, <19> {"0_31","10_30","17_30","18_30","19_19","19_30","9_31"}, <20> {"0_31","10_30","17_30","18_30","19_30","20_20","9_31"}, <21> {"0_31","10_30","17_30","18_30","19_30","21_21","9_31"}, <22> {"0_31","10_30","17_30","18_30","19_30","22_22","9_31"}, <23> {"0_31","10_30","17_30","18_30","19_30","23_23","23_30","9_31"}, <24> {"0_31","10_30","17_30","18_30","19_30","23_30","24_24","24_25","24_27","24_30","9_31"}, <25> {"0_31","10_30","17_30","18_30","19_30","23_30","24_25","24_27","24_30","25_25","9_31"}, <26> {"0_31","10_30","17_30","18_30","19_30","23_30","24_27","24_30","26_26","9_31"}, <27> {"0_31","10_30","17_30","18_30","19_30","23_30","24_27","24_30","27_27","9_31"}, <28> {"0_31","10_30","17_30","18_30","19_30","23_30","24_30","28_28","28_30","9_31"}, <29> {"0_31","10_30","17_30","18_30","19_30","23_30","24_30","28_30","29_29","29_30","9_31"}, <30> {"0_31","10_30","17_30","18_30","19_30","23_30","24_30","28_30","29_30","30_30","9_31"}, <31> {"0_31","31_31","9_31"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Terrorism"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Aggregate"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Desirability"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Emotion_directed"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Be_in_control"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Means"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Preventing"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Organization"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Active_substance"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Quitting_a_place"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Aggregate"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Membership"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Buildings"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Terrorism"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Aggregate"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Desirability"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Emotion_directed"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Possession"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Buildings"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Be_in_control"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Means"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Preventing"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Organization"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Active_substance"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Quitting_a_place"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Aggregate"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Membership"] do sum <s> in Spans : z14[r,s] == 1;
#pairwise exclusion constraint
set Exc4 := {<"Event","Experiencer">,<"Experiencer","Expressor">,<"Event","Expressor">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc9 := {<"Agent","Preventing_cause">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
