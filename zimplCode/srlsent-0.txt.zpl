# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Response","Assistance","Locating","Being_employed","Cause_change_of_position_on_a_scale","Political_locales","Secrecy_status","Supporting","Estimating","Cardinal_numbers","Cardinal_numbers"};
set Roles[Frames] :=  <"Response"> {"Responding_entity","Response","Agent","Manner","Dimension","Time","Role","Purpose","Trigger","Place"}, <"Assistance"> {"Purpose","Time","Goal","Place","Frequency","Degree","Helper","Means","Benefited_party","Domain","Duration","Focal_entity","Manner","Explanation"}, <"Locating"> {"Location","Perceiver","Ground","Sought_entity"}, <"Being_employed"> {"Type","Rank","Time","Place","Field","Employer","Place_of_employment","Amount_of_work","Compensation","Event_description","Duration","Frequency","Task","Employee","Contract_basis","Manner","Position"}, <"Cause_change_of_position_on_a_scale"> {"Purpose","Difference","Time","Place","Value_2","Value_1","Means","Cause","Path","Attribute","Item","Manner","Agent","Speed"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Secrecy_status"> {"Time","Phenomenon","Degree","Epistemic_stance","Cognizer"}, <"Supporting"> {"Event_description","Place","Supported","Degree","Manner","Time","Supporter","Means"}, <"Estimating"> {"Result","Circumstances","Value","Time","Place","Frequency","Means","Cognizer","Estimation","Evidence","Feature","Question","Item","Manner","Explanation"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"};
set Spans := {"-1_-1","0_0","0_25","0_3","10_10","11_11","12_12","13_13","13_15","13_18","14_14","15_15","16_16","17_17","18_18","19_19","19_24","1_1","1_3","20_20","20_24","21_21","22_22","23_23","24_24","25_25","2_2","2_3","3_3","4_4","5_5","5_9","6_6","6_9","7_7","7_8","7_9","8_8","8_9","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Response"]] binary;
var z1[Assignment["Assistance"]] binary;
var z2[Assignment["Locating"]] binary;
var z3[Assignment["Being_employed"]] binary;
var z4[Assignment["Cause_change_of_position_on_a_scale"]] binary;
var z5[Assignment["Political_locales"]] binary;
var z6[Assignment["Secrecy_status"]] binary;
var z7[Assignment["Supporting"]] binary;
var z8[Assignment["Estimating"]] binary;
var z9[Assignment["Cardinal_numbers"]] binary;
var z10[Assignment["Cardinal_numbers"]] binary;
param probabilities0[Assignment["Response"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Assistance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Locating"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Being_employed"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Cause_change_of_position_on_a_scale"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Political_locales"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Secrecy_status"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Supporting"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Estimating"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Cardinal_numbers"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Cardinal_numbers"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Response"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Assistance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Locating"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Being_employed"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Cause_change_of_position_on_a_scale"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Secrecy_status"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Supporting"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Estimating"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities10[r,s] * z10[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 25};
set G[I] := <0> {"0_0","0_25","0_3"}, <1> {"0_25","0_3","1_1","1_3"}, <2> {"0_25","0_3","1_3","2_2","2_3"}, <3> {"0_25","0_3","1_3","2_3","3_3"}, <4> {"0_25","4_4"}, <5> {"0_25","5_5","5_9"}, <6> {"0_25","5_9","6_6","6_9"}, <7> {"0_25","5_9","6_9","7_7","7_8","7_9"}, <8> {"0_25","5_9","6_9","7_8","7_9","8_8","8_9"}, <9> {"0_25","5_9","6_9","7_9","8_9","9_9"}, <10> {"0_25","10_10"}, <11> {"0_25","11_11"}, <12> {"0_25","12_12"}, <13> {"0_25","13_13","13_15","13_18"}, <14> {"0_25","13_15","13_18","14_14"}, <15> {"0_25","13_15","13_18","15_15"}, <16> {"0_25","13_18","16_16"}, <17> {"0_25","13_18","17_17"}, <18> {"0_25","13_18","18_18"}, <19> {"0_25","19_19","19_24"}, <20> {"0_25","19_24","20_20","20_24"}, <21> {"0_25","19_24","20_24","21_21"}, <22> {"0_25","19_24","20_24","22_22"}, <23> {"0_25","19_24","20_24","23_23"}, <24> {"0_25","19_24","20_24","24_24"}, <25> {"0_25","25_25"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Response"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Assistance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Locating"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Being_employed"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Cause_change_of_position_on_a_scale"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Secrecy_status"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Supporting"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Estimating"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Response"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Assistance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Locating"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Being_employed"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Cause_change_of_position_on_a_scale"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Secrecy_status"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Supporting"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Estimating"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z10[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Agent","Responding_entity">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc4 := {<"Agent","Cause">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc8 := {<"Estimation","Value">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr8 := {<"Feature","Item">,<"Item","Value">,<"Question","Value">};
subto require8: forall <ri,rj> in Reqr8 do z8[ri,"-1_-1"] - z8[rj,"-1_-1"] == 0;
