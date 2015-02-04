# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Part_orientational","Instance","Time_vector","Becoming_aware","Organization","Supply","Morality_evaluation","Documents","Protecting","Make_agreement_on_action","Relative_time","Giving","Part_orientational","Increment","Calendric_unit","Activity_finish","Make_agreement_on_action"};
set Roles[Frames] :=  <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Instance"> {"Type","Instance","Instance_Prop"}, <"Time_vector"> {"Distance","Event","Landmark_event","Direction"}, <"Becoming_aware"> {"Purpose","Circumstances","Topic","Time","Instrument","Frequency","Degree","Means","Period_of_iterations","Cognizer","State","Particular_iteration","Phenomenon","Ground","Manner","Evidence","Explanation"}, <"Organization"> {"Period_of_existence","Members","Place","Name","Container_possessor","Organization","Purpose","Descriptor"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Morality_evaluation"> {"Evaluee","Degree","Behavior","Expressor"}, <"Documents"> {"Obligation","Descriptor","Specification","Status","Issuer","Document","Bearer"}, <"Protecting"> {"Protection","Time","Descriptor","Instrument","Place","Degree","Asset","Means","Depictive","Danger","Duration","Beneficiary","Manner","Explanation"}, <"Make_agreement_on_action"> {"Place","Party_2","Party_1","Medium","Topic","Manner","Time","Parties","Obligation","Descriptor"}, <"Relative_time"> {"Focal_participant","Interval","Degree","Focal_occasion","Landmark_occasion"}, <"Giving"> {"Recipient","Donor","Circumstances","Time","Place","Theme","Purpose","Means","Period_of_iterations","Reason","Depictive","Purpose_of_theme","Manner"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Activity_finish"> {"Purpose","Circumstances","Subevent","Depictive","Place","Degree","Activity","Manner","Time","Means","Explanation","Agent"}, <"Make_agreement_on_action"> {"Place","Party_2","Party_1","Medium","Topic","Manner","Time","Parties","Obligation","Descriptor"};
set Spans := {"-1_-1","0_0","0_20","0_36","0_4","10_10","10_20","11_11","11_12","11_13","11_20","12_12","13_13","13_20","14_14","14_16","14_20","15_15","16_16","17_17","17_20","18_18","18_20","19_19","1_1","1_3","1_4","20_20","21_21","22_22","22_23","23_23","24_24","25_25","26_26","26_27","27_27","28_28","28_31","29_29","2_2","30_30","31_31","32_32","32_33","32_35","33_33","33_35","34_34","34_35","35_35","36_36","3_3","4_4","5_5","6_6","7_7","8_8","9_20","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Part_orientational"]] binary;
var z1[Assignment["Instance"]] binary;
var z2[Assignment["Time_vector"]] binary;
var z3[Assignment["Becoming_aware"]] binary;
var z4[Assignment["Organization"]] binary;
var z5[Assignment["Supply"]] binary;
var z6[Assignment["Morality_evaluation"]] binary;
var z7[Assignment["Documents"]] binary;
var z8[Assignment["Protecting"]] binary;
var z9[Assignment["Make_agreement_on_action"]] binary;
var z10[Assignment["Relative_time"]] binary;
var z11[Assignment["Giving"]] binary;
var z12[Assignment["Part_orientational"]] binary;
var z13[Assignment["Increment"]] binary;
var z14[Assignment["Calendric_unit"]] binary;
var z15[Assignment["Activity_finish"]] binary;
var z16[Assignment["Make_agreement_on_action"]] binary;
param probabilities0[Assignment["Part_orientational"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Instance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Time_vector"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Becoming_aware"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Organization"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Supply"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Morality_evaluation"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Documents"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Protecting"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Make_agreement_on_action"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Relative_time"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Giving"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Part_orientational"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Increment"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Calendric_unit"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Activity_finish"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Make_agreement_on_action"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Part_orientational"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Instance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Time_vector"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Becoming_aware"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Organization"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Morality_evaluation"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Documents"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Protecting"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Make_agreement_on_action"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Relative_time"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Giving"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Activity_finish"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Make_agreement_on_action"] : probabilities16[r,s] * z16[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 36};
set G[I] := <0> {"0_0","0_20","0_36","0_4"}, <1> {"0_20","0_36","0_4","1_1","1_3","1_4"}, <2> {"0_20","0_36","0_4","1_3","1_4","2_2"}, <3> {"0_20","0_36","0_4","1_3","1_4","3_3"}, <4> {"0_20","0_36","0_4","1_4","4_4"}, <5> {"0_20","0_36","5_5"}, <6> {"0_20","0_36","6_6"}, <7> {"0_20","0_36","7_7"}, <8> {"0_20","0_36","8_8"}, <9> {"0_20","0_36","9_20","9_9"}, <10> {"0_20","0_36","10_10","10_20","9_20"}, <11> {"0_20","0_36","10_20","11_11","11_12","11_13","11_20","9_20"}, <12> {"0_20","0_36","10_20","11_12","11_13","11_20","12_12","9_20"}, <13> {"0_20","0_36","10_20","11_13","11_20","13_13","13_20","9_20"}, <14> {"0_20","0_36","10_20","11_20","13_20","14_14","14_16","14_20","9_20"}, <15> {"0_20","0_36","10_20","11_20","13_20","14_16","14_20","15_15","9_20"}, <16> {"0_20","0_36","10_20","11_20","13_20","14_16","14_20","16_16","9_20"}, <17> {"0_20","0_36","10_20","11_20","13_20","14_20","17_17","17_20","9_20"}, <18> {"0_20","0_36","10_20","11_20","13_20","14_20","17_20","18_18","18_20","9_20"}, <19> {"0_20","0_36","10_20","11_20","13_20","14_20","17_20","18_20","19_19","9_20"}, <20> {"0_20","0_36","10_20","11_20","13_20","14_20","17_20","18_20","20_20","9_20"}, <21> {"0_36","21_21"}, <22> {"0_36","22_22","22_23"}, <23> {"0_36","22_23","23_23"}, <24> {"0_36","24_24"}, <25> {"0_36","25_25"}, <26> {"0_36","26_26","26_27"}, <27> {"0_36","26_27","27_27"}, <28> {"0_36","28_28","28_31"}, <29> {"0_36","28_31","29_29"}, <30> {"0_36","28_31","30_30"}, <31> {"0_36","28_31","31_31"}, <32> {"0_36","32_32","32_33","32_35"}, <33> {"0_36","32_33","32_35","33_33","33_35"}, <34> {"0_36","32_35","33_35","34_34","34_35"}, <35> {"0_36","32_35","33_35","34_35","35_35"}, <36> {"0_36","36_36"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Instance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Time_vector"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Becoming_aware"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Organization"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Morality_evaluation"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Documents"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Protecting"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Make_agreement_on_action"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Relative_time"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Giving"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Activity_finish"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Make_agreement_on_action"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Instance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Time_vector"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Becoming_aware"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Organization"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Supply"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Morality_evaluation"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Documents"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Protecting"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Make_agreement_on_action"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Relative_time"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Giving"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Increment"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Activity_finish"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Make_agreement_on_action"] do sum <s> in Spans : z16[r,s] == 1;
#pairwise exclusion constraint
set Exc9 := {<"Parties","Party_2">,<"Parties","Party_1">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
set Exc16 := {<"Parties","Party_2">,<"Parties","Party_1">};
subto exclusion16: forall <ri,rj> in Exc16 do z16[ri,"-1_-1"] + z16[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
