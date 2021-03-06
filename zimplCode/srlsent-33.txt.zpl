# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Buildings","Statement","Capability","Containing","Relational_quantity","Buildings","Building"};
set Roles[Frames] :=  <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Containing"> {"Container","Time","Contents"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Building"> {"Purpose","Result","Components","Time","Descriptor","Instrument","Place","Created_entity","Means","Period_of_iterations","Particular_iteration","Duration","Beneficiary","Manner","Agent"};
set Spans := {"-1_-1","0_0","0_38","0_4","0_7","0_9","10_10","11_11","12_12","13_13","13_14","14_14","15_15","16_16","16_18","16_21","17_17","18_18","19_19","19_21","1_1","1_3","1_4","20_20","20_21","21_21","22_22","23_23","24_24","25_25","25_36","26_26","27_27","27_36","28_28","29_29","2_2","30_30","30_32","31_31","31_32","32_32","33_33","33_36","34_34","34_35","34_36","35_35","35_36","36_36","37_37","38_38","3_3","4_4","5_5","6_6","7_7","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Buildings"]] binary;
var z1[Assignment["Statement"]] binary;
var z2[Assignment["Capability"]] binary;
var z3[Assignment["Containing"]] binary;
var z4[Assignment["Relational_quantity"]] binary;
var z5[Assignment["Buildings"]] binary;
var z6[Assignment["Building"]] binary;
param probabilities0[Assignment["Buildings"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Statement"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Capability"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Containing"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Relational_quantity"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Buildings"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Building"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Buildings"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Containing"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Buildings"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Building"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 38};
set G[I] := <0> {"0_0","0_38","0_4","0_7","0_9"}, <1> {"0_38","0_4","0_7","0_9","1_1","1_3","1_4"}, <2> {"0_38","0_4","0_7","0_9","1_3","1_4","2_2"}, <3> {"0_38","0_4","0_7","0_9","1_3","1_4","3_3"}, <4> {"0_38","0_4","0_7","0_9","1_4","4_4"}, <5> {"0_38","0_7","0_9","5_5"}, <6> {"0_38","0_7","0_9","6_6"}, <7> {"0_38","0_7","0_9","7_7"}, <8> {"0_38","0_9","8_8","8_9"}, <9> {"0_38","0_9","8_9","9_9"}, <10> {"0_38","10_10"}, <11> {"0_38","11_11"}, <12> {"0_38","12_12"}, <13> {"0_38","13_13","13_14"}, <14> {"0_38","13_14","14_14"}, <15> {"0_38","15_15"}, <16> {"0_38","16_16","16_18","16_21"}, <17> {"0_38","16_18","16_21","17_17"}, <18> {"0_38","16_18","16_21","18_18"}, <19> {"0_38","16_21","19_19","19_21"}, <20> {"0_38","16_21","19_21","20_20","20_21"}, <21> {"0_38","16_21","19_21","20_21","21_21"}, <22> {"0_38","22_22"}, <23> {"0_38","23_23"}, <24> {"0_38","24_24"}, <25> {"0_38","25_25","25_36"}, <26> {"0_38","25_36","26_26"}, <27> {"0_38","25_36","27_27","27_36"}, <28> {"0_38","25_36","27_36","28_28"}, <29> {"0_38","25_36","27_36","29_29"}, <30> {"0_38","25_36","27_36","30_30","30_32"}, <31> {"0_38","25_36","27_36","30_32","31_31","31_32"}, <32> {"0_38","25_36","27_36","30_32","31_32","32_32"}, <33> {"0_38","25_36","27_36","33_33","33_36"}, <34> {"0_38","25_36","27_36","33_36","34_34","34_35","34_36"}, <35> {"0_38","25_36","27_36","33_36","34_35","34_36","35_35","35_36"}, <36> {"0_38","25_36","27_36","33_36","34_36","35_36","36_36"}, <37> {"0_38","37_37"}, <38> {"0_38","38_38"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Containing"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Building"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Buildings"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Statement"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Capability"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Containing"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Buildings"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Building"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
