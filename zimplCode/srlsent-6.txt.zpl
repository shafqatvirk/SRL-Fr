# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Increment","People","Assistance","Possession","Quantity","Locating","Activity_ongoing","Being_employed"};
set Roles[Frames] :=  <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"People"> {"Person","Ethnicity","Persistent_characteristic","Context_of_acquaintance","Descriptor","Age","Origin"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Locating"> {"Location","Perceiver","Ground","Sought_entity"}, <"Activity_ongoing"> {"Purpose","Circumstances","Depictive","Activity","Event_description","Duration","Manner","Time","Explanation","Means","Subevent","Agent"}, <"Being_employed"> {"Type","Rank","Time","Place","Field","Employer","Place_of_employment","Amount_of_work","Compensation","Event_description","Duration","Frequency","Task","Employee","Contract_basis","Manner","Position"};
set Spans := {"-1_-1","0_0","0_14","0_28","0_4","10_10","10_11","11_11","12_12","13_13","13_14","14_14","15_15","16_16","16_18","17_17","17_18","18_18","19_19","1_1","1_2","1_4","20_20","20_21","20_27","21_21","22_22","22_27","23_23","23_27","24_24","25_25","25_27","26_26","26_27","27_27","28_28","2_2","3_3","3_4","4_4","5_5","6_6","6_7","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Increment"]] binary;
var z1[Assignment["People"]] binary;
var z2[Assignment["Assistance"]] binary;
var z3[Assignment["Possession"]] binary;
var z4[Assignment["Quantity"]] binary;
var z5[Assignment["Locating"]] binary;
var z6[Assignment["Activity_ongoing"]] binary;
var z7[Assignment["Being_employed"]] binary;
param probabilities0[Assignment["Increment"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["People"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Assistance"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Possession"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Quantity"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Locating"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Activity_ongoing"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Being_employed"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Increment"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["People"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Locating"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Activity_ongoing"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Being_employed"] : probabilities7[r,s] * z7[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 28};
set G[I] := <0> {"0_0","0_14","0_28","0_4"}, <1> {"0_14","0_28","0_4","1_1","1_2","1_4"}, <2> {"0_14","0_28","0_4","1_2","1_4","2_2"}, <3> {"0_14","0_28","0_4","1_4","3_3","3_4"}, <4> {"0_14","0_28","0_4","1_4","3_4","4_4"}, <5> {"0_14","0_28","5_5"}, <6> {"0_14","0_28","6_6","6_7"}, <7> {"0_14","0_28","6_7","7_7"}, <8> {"0_14","0_28","8_8"}, <9> {"0_14","0_28","9_9"}, <10> {"0_14","0_28","10_10","10_11"}, <11> {"0_14","0_28","10_11","11_11"}, <12> {"0_14","0_28","12_12"}, <13> {"0_14","0_28","13_13","13_14"}, <14> {"0_14","0_28","13_14","14_14"}, <15> {"0_28","15_15"}, <16> {"0_28","16_16","16_18"}, <17> {"0_28","16_18","17_17","17_18"}, <18> {"0_28","16_18","17_18","18_18"}, <19> {"0_28","19_19"}, <20> {"0_28","20_20","20_21","20_27"}, <21> {"0_28","20_21","20_27","21_21"}, <22> {"0_28","20_27","22_22","22_27"}, <23> {"0_28","20_27","22_27","23_23","23_27"}, <24> {"0_28","20_27","22_27","23_27","24_24"}, <25> {"0_28","20_27","22_27","23_27","25_25","25_27"}, <26> {"0_28","20_27","22_27","23_27","25_27","26_26","26_27"}, <27> {"0_28","20_27","22_27","23_27","25_27","26_27","27_27"}, <28> {"0_28","28_28"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["People"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Locating"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Activity_ongoing"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Being_employed"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Increment"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["People"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Assistance"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Possession"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Quantity"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Locating"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Activity_ongoing"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Being_employed"] do sum <s> in Spans : z7[r,s] == 1;
#pairwise exclusion constraint
set Exc4 := {<"Individuals","Mass">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
#pairwise requirement constraint