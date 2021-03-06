# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Sending","Statement","Telling","Membership","Statement","Commerce_sell","Substance","Cause_change","Locale_by_use"};
set Roles[Frames] :=  <"Sending"> {"Recipient","Depictive","Time","Place","Goal","Co_theme","Theme","Purpose","Source","Sender","Reason","Transport_means","Container","Path"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Telling"> {"Iteration","Topic","Time","Descriptor","Place","Addressee","Epistemic_stance","Manner","Means","Message","Speaker","Medium"}, <"Membership"> {"Member","Standing","Group"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Commerce_sell"> {"Purpose","Result","Unit","Purpose_of_Goods","Goods","Place","Seller","Rate","Manner","Relay","Buyer","Means","Time","Money"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Cause_change"> {"Duration","Purpose","Attribute","Initial_value","Role","Circumstances","Agent","Manner","Means","Event_description","Final_category","Cause","Time","Period_of_iterations","Containing_event","Degree","Place","Re_encoding","Reason","Initial_category","Final_value","Entity"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_2","0_25","10_10","11_11","11_24","12_12","12_13","12_24","13_13","13_24","14_14","14_24","15_15","15_24","16_16","17_17","18_18","18_22","19_19","19_22","1_1","20_20","21_21","22_22","23_23","23_24","24_24","25_25","2_2","3_25","3_3","4_24","4_4","5_24","5_5","5_6","6_6","7_24","7_7","8_10","8_8","9_10","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Sending"]] binary;
var z1[Assignment["Statement"]] binary;
var z2[Assignment["Telling"]] binary;
var z3[Assignment["Membership"]] binary;
var z4[Assignment["Statement"]] binary;
var z5[Assignment["Commerce_sell"]] binary;
var z6[Assignment["Substance"]] binary;
var z7[Assignment["Cause_change"]] binary;
var z8[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Sending"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Statement"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Telling"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Membership"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Statement"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Commerce_sell"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Substance"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Cause_change"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Locale_by_use"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Sending"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Telling"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Membership"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Commerce_sell"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Cause_change"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 25};
set G[I] := <0> {"0_0","0_2","0_25"}, <1> {"0_2","0_25","1_1"}, <2> {"0_2","0_25","2_2"}, <3> {"0_25","3_25","3_3"}, <4> {"0_25","3_25","4_24","4_4"}, <5> {"0_25","3_25","4_24","5_24","5_5","5_6"}, <6> {"0_25","3_25","4_24","5_24","5_6","6_6"}, <7> {"0_25","3_25","4_24","5_24","7_24","7_7"}, <8> {"0_25","3_25","4_24","5_24","7_24","8_10","8_8"}, <9> {"0_25","3_25","4_24","5_24","7_24","8_10","9_10","9_9"}, <10> {"0_25","10_10","3_25","4_24","5_24","7_24","8_10","9_10"}, <11> {"0_25","11_11","11_24","3_25","4_24","5_24","7_24"}, <12> {"0_25","11_24","12_12","12_13","12_24","3_25","4_24","5_24","7_24"}, <13> {"0_25","11_24","12_13","12_24","13_13","13_24","3_25","4_24","5_24","7_24"}, <14> {"0_25","11_24","12_24","13_24","14_14","14_24","3_25","4_24","5_24","7_24"}, <15> {"0_25","11_24","12_24","13_24","14_24","15_15","15_24","3_25","4_24","5_24","7_24"}, <16> {"0_25","11_24","12_24","13_24","14_24","15_24","16_16","3_25","4_24","5_24","7_24"}, <17> {"0_25","11_24","12_24","13_24","14_24","15_24","17_17","3_25","4_24","5_24","7_24"}, <18> {"0_25","11_24","12_24","13_24","14_24","15_24","18_18","18_22","3_25","4_24","5_24","7_24"}, <19> {"0_25","11_24","12_24","13_24","14_24","15_24","18_22","19_19","19_22","3_25","4_24","5_24","7_24"}, <20> {"0_25","11_24","12_24","13_24","14_24","15_24","18_22","19_22","20_20","3_25","4_24","5_24","7_24"}, <21> {"0_25","11_24","12_24","13_24","14_24","15_24","18_22","19_22","21_21","3_25","4_24","5_24","7_24"}, <22> {"0_25","11_24","12_24","13_24","14_24","15_24","18_22","19_22","22_22","3_25","4_24","5_24","7_24"}, <23> {"0_25","11_24","12_24","13_24","14_24","15_24","23_23","23_24","3_25","4_24","5_24","7_24"}, <24> {"0_25","11_24","12_24","13_24","14_24","15_24","23_24","24_24","3_25","4_24","5_24","7_24"}, <25> {"0_25","25_25","3_25"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Sending"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Telling"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Membership"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Commerce_sell"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Cause_change"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Sending"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Statement"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Telling"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Membership"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Statement"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Commerce_sell"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Substance"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Cause_change"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc7 := {<"Final_category","Initial_value">,<"Attribute","Final_category">,<"Agent","Cause">,<"Final_category","Final_value">,<"Initial_category","Initial_value">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr7 := {<"Attribute","Final_value">,<"Attribute","Initial_value">};
subto require7: forall <ri,rj> in Reqr7 do z7[ri,"-1_-1"] - z7[rj,"-1_-1"] == 0;
