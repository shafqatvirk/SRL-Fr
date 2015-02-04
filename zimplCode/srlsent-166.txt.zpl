# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Choosing","Locale","Measure_duration","Importance","Locale_by_use","Possession","Substance"};
set Roles[Frames] :=  <"Choosing"> {"Contrast","Possibilities","Cognizer","Topic","Manner","Chosen","Time","Reason","Intended_purpose"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"}, <"Measure_duration"> {"Agent","Count","Unit","Process"}, <"Importance"> {"Place","Undertaking","Explanation","Field","Time","Factor","Reason","Frequency","Degree","Interested_party"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"};
set Spans := {"-1_-1","0_0","0_16","10_10","11_11","12_12","12_15","13_13","13_15","14_14","14_15","15_15","16_16","1_1","1_15","2_2","2_3","3_3","4_4","5_15","5_5","5_7","5_8","6_6","7_7","8_15","8_8","9_15","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Choosing"]] binary;
var z1[Assignment["Locale"]] binary;
var z2[Assignment["Measure_duration"]] binary;
var z3[Assignment["Importance"]] binary;
var z4[Assignment["Locale_by_use"]] binary;
var z5[Assignment["Possession"]] binary;
var z6[Assignment["Substance"]] binary;
param probabilities0[Assignment["Choosing"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Locale"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Measure_duration"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Importance"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Locale_by_use"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Possession"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Substance"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Choosing"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Measure_duration"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Importance"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities6[r,s] * z6[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 16};
set G[I] := <0> {"0_0","0_16"}, <1> {"0_16","1_1","1_15"}, <2> {"0_16","1_15","2_2","2_3"}, <3> {"0_16","1_15","2_3","3_3"}, <4> {"0_16","1_15","4_4"}, <5> {"0_16","1_15","5_15","5_5","5_7","5_8"}, <6> {"0_16","1_15","5_15","5_7","5_8","6_6"}, <7> {"0_16","1_15","5_15","5_7","5_8","7_7"}, <8> {"0_16","1_15","5_15","5_8","8_15","8_8"}, <9> {"0_16","1_15","5_15","8_15","9_15","9_9"}, <10> {"0_16","10_10","1_15","5_15","8_15","9_15"}, <11> {"0_16","11_11","1_15","5_15","8_15","9_15"}, <12> {"0_16","12_12","12_15","1_15","5_15","8_15","9_15"}, <13> {"0_16","12_15","13_13","13_15","1_15","5_15","8_15","9_15"}, <14> {"0_16","12_15","13_15","14_14","14_15","1_15","5_15","8_15","9_15"}, <15> {"0_16","12_15","13_15","14_15","15_15","1_15","5_15","8_15","9_15"}, <16> {"0_16","16_16"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Choosing"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Importance"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Choosing"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Locale"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Importance"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Possession"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Substance"] do sum <s> in Spans : z6[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Field","Interested_party">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
#pairwise requirement constraint