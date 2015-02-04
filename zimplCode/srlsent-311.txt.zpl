# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Operational_testing","Active_substance","Unattributed_information","Intentionally_act","Cardinal_numbers","Locale","Likelihood","Degree","Dimension","Locative_relation","Locale_by_use"};
set Roles[Frames] :=  <"Operational_testing"> {"Purpose","Result","Circumstances","Desired_state","Time","Tester","Place","Degree","Unwanted_characteristics","Tested_property","Means","Period_of_iterations","Duration","Product","Manner"}, <"Active_substance"> {"Name","Type","Substance","Descriptor","Effect"}, <"Unattributed_information"> {"Reported_fact","Time","Explanation","Duration"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"}, <"Likelihood"> {"Time","Place","Circumstances","Reason","Hypothetical_event","Degree"}, <"Degree"> {"Gradable_attribute"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_18","0_2","10_10","11_11","12_12","12_13","12_17","13_13","13_17","14_14","14_15","14_17","15_15","16_16","17_17","18_18","1_1","1_2","2_2","3_18","3_3","4_4","5_17","5_5","6_17","6_6","7_10","7_7","8_10","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Operational_testing"]] binary;
var z1[Assignment["Active_substance"]] binary;
var z2[Assignment["Unattributed_information"]] binary;
var z3[Assignment["Intentionally_act"]] binary;
var z4[Assignment["Cardinal_numbers"]] binary;
var z5[Assignment["Locale"]] binary;
var z6[Assignment["Likelihood"]] binary;
var z7[Assignment["Degree"]] binary;
var z8[Assignment["Dimension"]] binary;
var z9[Assignment["Locative_relation"]] binary;
var z10[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Operational_testing"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Active_substance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Unattributed_information"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Intentionally_act"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Cardinal_numbers"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Locale"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Likelihood"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Degree"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Dimension"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Locative_relation"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Locale_by_use"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Operational_testing"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Active_substance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Unattributed_information"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Likelihood"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Degree"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities10[r,s] * z10[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 18};
set G[I] := <0> {"0_0","0_18","0_2"}, <1> {"0_18","0_2","1_1","1_2"}, <2> {"0_18","0_2","1_2","2_2"}, <3> {"0_18","3_18","3_3"}, <4> {"0_18","3_18","4_4"}, <5> {"0_18","3_18","5_17","5_5"}, <6> {"0_18","3_18","5_17","6_17","6_6"}, <7> {"0_18","3_18","5_17","6_17","7_10","7_7"}, <8> {"0_18","3_18","5_17","6_17","7_10","8_10","8_8"}, <9> {"0_18","3_18","5_17","6_17","7_10","8_10","9_9"}, <10> {"0_18","10_10","3_18","5_17","6_17","7_10","8_10"}, <11> {"0_18","11_11","3_18","5_17","6_17"}, <12> {"0_18","12_12","12_13","12_17","3_18","5_17","6_17"}, <13> {"0_18","12_13","12_17","13_13","13_17","3_18","5_17","6_17"}, <14> {"0_18","12_17","13_17","14_14","14_15","14_17","3_18","5_17","6_17"}, <15> {"0_18","12_17","13_17","14_15","14_17","15_15","3_18","5_17","6_17"}, <16> {"0_18","12_17","13_17","14_17","16_16","3_18","5_17","6_17"}, <17> {"0_18","12_17","13_17","14_17","17_17","3_18","5_17","6_17"}, <18> {"0_18","18_18","3_18"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Operational_testing"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Active_substance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Unattributed_information"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Likelihood"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Degree"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Operational_testing"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Active_substance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Unattributed_information"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Locale"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Likelihood"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Degree"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Dimension"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z10[r,s] == 1;
#pairwise exclusion constraint
set Exc9 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion9: forall <ri,rj> in Exc9 do z9[ri,"-1_-1"] + z9[rj,"-1_-1"] >= 1;
#pairwise requirement constraint