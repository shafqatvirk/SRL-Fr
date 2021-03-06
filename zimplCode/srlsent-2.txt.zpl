# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Quantity","Calendric_unit","Receiving","Text","Telling","Success_or_failure","People","Getting","Being_employed","Assistance"};
set Roles[Frames] :=  <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Receiving"> {"Mode_of_transfer","Place","Theme","Path","Manner","Donor","Means","Time","Purpose_of_theme","Countertransfer","Recipient"}, <"Text"> {"Topic","Honoree","Use","Author","Containing_text","Genre","Material","Components","Time_of_creation","Title","Text","Medium"}, <"Telling"> {"Iteration","Topic","Time","Descriptor","Place","Addressee","Epistemic_stance","Manner","Means","Message","Speaker","Medium"}, <"Success_or_failure"> {"Place","Agent","Goal","Degree","Re_enconding","Depictive","Explanation","Time","Circumstances","Means","Role"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Getting"> {"Recipient","Result","Time","Place","Purpose","Means","Source","Theme","Reason","Beneficiary","Manner","Concessive"}, <"Being_employed"> {"Type","Rank","Time","Place","Field","Employer","Place_of_employment","Amount_of_work","Compensation","Event_description","Duration","Frequency","Task","Employee","Contract_basis","Manner","Position"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"};
set Spans := {"-1_-1","0_0","0_2","0_23","0_3","10_10","10_22","11_11","11_13","11_22","12_12","13_13","14_14","14_22","15_15","15_22","16_16","16_22","17_17","17_22","18_18","19_19","19_22","1_1","20_20","20_21","20_22","21_21","22_22","23_23","2_2","3_3","4_4","5_5","6_6","6_7","7_7","8_22","8_8","9_10","9_22","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Quantity"]] binary;
var z1[Assignment["Calendric_unit"]] binary;
var z2[Assignment["Receiving"]] binary;
var z3[Assignment["Text"]] binary;
var z4[Assignment["Telling"]] binary;
var z5[Assignment["Success_or_failure"]] binary;
var z6[Assignment["People"]] binary;
var z7[Assignment["Getting"]] binary;
var z8[Assignment["Being_employed"]] binary;
var z9[Assignment["Assistance"]] binary;
param probabilities0[Assignment["Quantity"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Calendric_unit"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Receiving"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Text"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Telling"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Success_or_failure"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["People"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Getting"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Being_employed"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Assistance"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Quantity"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Receiving"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Text"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Telling"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Success_or_failure"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["People"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Getting"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Being_employed"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 23};
set G[I] := <0> {"0_0","0_2","0_23","0_3"}, <1> {"0_2","0_23","0_3","1_1"}, <2> {"0_2","0_23","0_3","2_2"}, <3> {"0_23","0_3","3_3"}, <4> {"0_23","4_4"}, <5> {"0_23","5_5"}, <6> {"0_23","6_6","6_7"}, <7> {"0_23","6_7","7_7"}, <8> {"0_23","8_22","8_8"}, <9> {"0_23","8_22","9_10","9_22","9_9"}, <10> {"0_23","10_10","10_22","8_22","9_10","9_22"}, <11> {"0_23","10_22","11_11","11_13","11_22","8_22","9_22"}, <12> {"0_23","10_22","11_13","11_22","12_12","8_22","9_22"}, <13> {"0_23","10_22","11_13","11_22","13_13","8_22","9_22"}, <14> {"0_23","10_22","11_22","14_14","14_22","8_22","9_22"}, <15> {"0_23","10_22","11_22","14_22","15_15","15_22","8_22","9_22"}, <16> {"0_23","10_22","11_22","14_22","15_22","16_16","16_22","8_22","9_22"}, <17> {"0_23","10_22","11_22","14_22","15_22","16_22","17_17","17_22","8_22","9_22"}, <18> {"0_23","10_22","11_22","14_22","15_22","16_22","17_22","18_18","8_22","9_22"}, <19> {"0_23","10_22","11_22","14_22","15_22","16_22","17_22","19_19","19_22","8_22","9_22"}, <20> {"0_23","10_22","11_22","14_22","15_22","16_22","17_22","19_22","20_20","20_21","20_22","8_22","9_22"}, <21> {"0_23","10_22","11_22","14_22","15_22","16_22","17_22","19_22","20_21","20_22","21_21","8_22","9_22"}, <22> {"0_23","10_22","11_22","14_22","15_22","16_22","17_22","19_22","20_22","22_22","8_22","9_22"}, <23> {"0_23","23_23"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Receiving"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Text"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Telling"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Success_or_failure"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Getting"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Being_employed"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Quantity"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Receiving"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Text"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Telling"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Success_or_failure"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["People"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Getting"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Being_employed"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Assistance"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Individuals","Mass">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc5 := {<"Goal","Role">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
