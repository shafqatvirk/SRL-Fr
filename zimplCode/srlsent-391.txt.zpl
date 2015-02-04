# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Foreign_or_domestic_country","Being_at_risk","Cause_to_fragment","Ground_up","Calendric_unit","Political_locales","Locale_by_use","Scrutiny","Locale_by_use"};
set Roles[Frames] :=  <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Being_at_risk"> {"Domain","Time","Place","Degree","Situation","Asset","Harmful_event","Depictive","Duration","Dangerous_entity","Frequency","Explanation"}, <"Cause_to_fragment"> {"Purpose","Result","Time","Instrument","Place","Pieces","Degree","Cause","Reason","Resistant_surface","Whole_patient","Manner","Subregion","Means","Agent"}, <"Ground_up"> {"Result","Undergoer"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Scrutiny"> {"Instrument","Cognizer","Phenomenon","Degree","Manner","Ground","Time","Means","Medium","Purpose","Direction"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_2","0_20","0_5","10_10","11_11","12_12","12_19","13_13","13_19","14_14","15_15","16_16","17_17","18_18","19_19","1_1","20_20","2_2","3_3","3_5","4_4","4_5","5_5","6_20","6_6","7_19","7_7","8_19","8_8","9_19","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Foreign_or_domestic_country"]] binary;
var z1[Assignment["Being_at_risk"]] binary;
var z2[Assignment["Cause_to_fragment"]] binary;
var z3[Assignment["Ground_up"]] binary;
var z4[Assignment["Calendric_unit"]] binary;
var z5[Assignment["Political_locales"]] binary;
var z6[Assignment["Locale_by_use"]] binary;
var z7[Assignment["Scrutiny"]] binary;
var z8[Assignment["Locale_by_use"]] binary;
param probabilities0[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Being_at_risk"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Cause_to_fragment"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Ground_up"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Calendric_unit"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Political_locales"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Locale_by_use"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Scrutiny"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Locale_by_use"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Being_at_risk"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Cause_to_fragment"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Ground_up"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Scrutiny"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 20};
set G[I] := <0> {"0_0","0_2","0_20","0_5"}, <1> {"0_2","0_20","0_5","1_1"}, <2> {"0_2","0_20","0_5","2_2"}, <3> {"0_20","0_5","3_3","3_5"}, <4> {"0_20","0_5","3_5","4_4","4_5"}, <5> {"0_20","0_5","3_5","4_5","5_5"}, <6> {"0_20","6_20","6_6"}, <7> {"0_20","6_20","7_19","7_7"}, <8> {"0_20","6_20","7_19","8_19","8_8"}, <9> {"0_20","6_20","7_19","8_19","9_19","9_9"}, <10> {"0_20","10_10","6_20","7_19","8_19","9_19"}, <11> {"0_20","11_11","6_20","7_19","8_19","9_19"}, <12> {"0_20","12_12","12_19","6_20","7_19","8_19","9_19"}, <13> {"0_20","12_19","13_13","13_19","6_20","7_19","8_19","9_19"}, <14> {"0_20","12_19","13_19","14_14","6_20","7_19","8_19","9_19"}, <15> {"0_20","12_19","13_19","15_15","6_20","7_19","8_19","9_19"}, <16> {"0_20","12_19","13_19","16_16","6_20","7_19","8_19","9_19"}, <17> {"0_20","12_19","13_19","17_17","6_20","7_19","8_19","9_19"}, <18> {"0_20","12_19","13_19","18_18","6_20","7_19","8_19","9_19"}, <19> {"0_20","12_19","13_19","19_19","6_20","7_19","8_19","9_19"}, <20> {"0_20","20_20","6_20"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Being_at_risk"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Cause_to_fragment"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Ground_up"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Scrutiny"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Being_at_risk"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Cause_to_fragment"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Ground_up"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Scrutiny"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc1 := {<"Dangerous_entity","Harmful_event">};
subto exclusion1: forall <ri,rj> in Exc1 do z1[ri,"-1_-1"] + z1[rj,"-1_-1"] >= 1;
set Exc2 := {<"Agent","Cause">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint