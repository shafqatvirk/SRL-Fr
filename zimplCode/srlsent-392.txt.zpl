# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Substance","Active_substance","Locale_by_use","Possession","Increment","Cardinal_numbers","Risky_situation","Being_employed","Calendric_unit","Cardinal_numbers","Risky_situation","Being_employed","Calendric_unit","Frequency","Cardinal_numbers","Measure_duration","Working_on","Temporal_subregion","Calendric_unit"};
set Roles[Frames] :=  <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Active_substance"> {"Name","Type","Substance","Descriptor","Effect"}, <"Locale_by_use"> {"Formational_cause","Use","Locale","Relative_location","Name","Container_possessor","Constituent_parts","Descriptor"}, <"Possession"> {"Explanation","Time","Owner","Possession","Duration","Manner","Depictive"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Risky_situation"> {"Dangerous_entity","Asset","Degree","Domain","Situation","Time","Circumstances","Frequency"}, <"Being_employed"> {"Type","Rank","Time","Place","Field","Employer","Place_of_employment","Amount_of_work","Compensation","Event_description","Duration","Frequency","Task","Employee","Contract_basis","Manner","Position"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Risky_situation"> {"Dangerous_entity","Asset","Degree","Domain","Situation","Time","Circumstances","Frequency"}, <"Being_employed"> {"Type","Rank","Time","Place","Field","Employer","Place_of_employment","Amount_of_work","Compensation","Event_description","Duration","Frequency","Task","Employee","Contract_basis","Manner","Position"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Frequency"> {"Time_span","Attribute","Degree","Time","Event","Interval","Rate","Salient_entity"}, <"Cardinal_numbers"> {"Precision","Number","Multiplier","Entity"}, <"Measure_duration"> {"Agent","Count","Unit","Process"}, <"Working_on"> {"Purpose","Descriptor","Event_description","Time","Goal","Salient_entity","Place","Frequency","Degree","Means","Domain","Depictive","Duration","Particular_iteration","Manner","Agent"}, <"Temporal_subregion"> {"Time_period","Time","Degree","Sub_part"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"};
set Spans := {"-1_-1","0_0","0_1","0_11","0_46","10_10","11_11","12_12","12_46","13_13","13_16","13_19","13_31","13_45","14_14","14_16","15_15","16_16","17_17","18_18","19_19","1_1","20_20","21_21","22_22","23_23","23_26","24_24","25_25","26_26","27_27","28_28","29_29","2_2","30_30","31_31","32_32","32_45","33_33","33_45","34_34","34_35","34_39","34_45","35_35","36_36","37_37","37_38","38_38","39_39","3_3","3_4","40_40","40_45","41_41","41_45","42_42","42_43","42_45","43_43","44_44","44_45","45_45","46_46","4_4","5_5","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Substance"]] binary;
var z1[Assignment["Active_substance"]] binary;
var z2[Assignment["Locale_by_use"]] binary;
var z3[Assignment["Possession"]] binary;
var z4[Assignment["Increment"]] binary;
var z5[Assignment["Cardinal_numbers"]] binary;
var z6[Assignment["Risky_situation"]] binary;
var z7[Assignment["Being_employed"]] binary;
var z8[Assignment["Calendric_unit"]] binary;
var z9[Assignment["Cardinal_numbers"]] binary;
var z10[Assignment["Risky_situation"]] binary;
var z11[Assignment["Being_employed"]] binary;
var z12[Assignment["Calendric_unit"]] binary;
var z13[Assignment["Frequency"]] binary;
var z14[Assignment["Cardinal_numbers"]] binary;
var z15[Assignment["Measure_duration"]] binary;
var z16[Assignment["Working_on"]] binary;
var z17[Assignment["Temporal_subregion"]] binary;
var z18[Assignment["Calendric_unit"]] binary;
param probabilities0[Assignment["Substance"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Active_substance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Locale_by_use"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Possession"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Increment"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Cardinal_numbers"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Risky_situation"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Being_employed"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Calendric_unit"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Cardinal_numbers"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Risky_situation"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Being_employed"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Calendric_unit"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Frequency"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Cardinal_numbers"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Measure_duration"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Working_on"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Temporal_subregion"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Calendric_unit"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Substance"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Active_substance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Locale_by_use"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Possession"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Risky_situation"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Being_employed"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Risky_situation"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Being_employed"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Frequency"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Cardinal_numbers"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Measure_duration"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Working_on"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Temporal_subregion"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities18[r,s] * z18[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 46};
set G[I] := <0> {"0_0","0_1","0_11","0_46"}, <1> {"0_1","0_11","0_46","1_1"}, <2> {"0_11","0_46","2_2"}, <3> {"0_11","0_46","3_3","3_4"}, <4> {"0_11","0_46","3_4","4_4"}, <5> {"0_11","0_46","5_5"}, <6> {"0_11","0_46","6_6"}, <7> {"0_11","0_46","7_7"}, <8> {"0_11","0_46","8_8"}, <9> {"0_11","0_46","9_9"}, <10> {"0_11","0_46","10_10"}, <11> {"0_11","0_46","11_11"}, <12> {"0_46","12_12","12_46"}, <13> {"0_46","12_46","13_13","13_16","13_19","13_31","13_45"}, <14> {"0_46","12_46","13_16","13_19","13_31","13_45","14_14","14_16"}, <15> {"0_46","12_46","13_16","13_19","13_31","13_45","14_16","15_15"}, <16> {"0_46","12_46","13_16","13_19","13_31","13_45","14_16","16_16"}, <17> {"0_46","12_46","13_19","13_31","13_45","17_17"}, <18> {"0_46","12_46","13_19","13_31","13_45","18_18"}, <19> {"0_46","12_46","13_19","13_31","13_45","19_19"}, <20> {"0_46","12_46","13_31","13_45","20_20"}, <21> {"0_46","12_46","13_31","13_45","21_21"}, <22> {"0_46","12_46","13_31","13_45","22_22"}, <23> {"0_46","12_46","13_31","13_45","23_23","23_26"}, <24> {"0_46","12_46","13_31","13_45","23_26","24_24"}, <25> {"0_46","12_46","13_31","13_45","23_26","25_25"}, <26> {"0_46","12_46","13_31","13_45","23_26","26_26"}, <27> {"0_46","12_46","13_31","13_45","27_27"}, <28> {"0_46","12_46","13_31","13_45","28_28"}, <29> {"0_46","12_46","13_31","13_45","29_29"}, <30> {"0_46","12_46","13_31","13_45","30_30"}, <31> {"0_46","12_46","13_31","13_45","31_31"}, <32> {"0_46","12_46","13_45","32_32","32_45"}, <33> {"0_46","12_46","13_45","32_45","33_33","33_45"}, <34> {"0_46","12_46","13_45","32_45","33_45","34_34","34_35","34_39","34_45"}, <35> {"0_46","12_46","13_45","32_45","33_45","34_35","34_39","34_45","35_35"}, <36> {"0_46","12_46","13_45","32_45","33_45","34_39","34_45","36_36"}, <37> {"0_46","12_46","13_45","32_45","33_45","34_39","34_45","37_37","37_38"}, <38> {"0_46","12_46","13_45","32_45","33_45","34_39","34_45","37_38","38_38"}, <39> {"0_46","12_46","13_45","32_45","33_45","34_39","34_45","39_39"}, <40> {"0_46","12_46","13_45","32_45","33_45","34_45","40_40","40_45"}, <41> {"0_46","12_46","13_45","32_45","33_45","34_45","40_45","41_41","41_45"}, <42> {"0_46","12_46","13_45","32_45","33_45","34_45","40_45","41_45","42_42","42_43","42_45"}, <43> {"0_46","12_46","13_45","32_45","33_45","34_45","40_45","41_45","42_43","42_45","43_43"}, <44> {"0_46","12_46","13_45","32_45","33_45","34_45","40_45","41_45","42_45","44_44","44_45"}, <45> {"0_46","12_46","13_45","32_45","33_45","34_45","40_45","41_45","42_45","44_45","45_45"}, <46> {"0_46","12_46","46_46"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Active_substance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Locale_by_use"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Possession"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Risky_situation"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Being_employed"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Risky_situation"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Being_employed"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Frequency"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Cardinal_numbers"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Measure_duration"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Working_on"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Temporal_subregion"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Substance"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Active_substance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Locale_by_use"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Possession"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Increment"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Risky_situation"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Being_employed"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Risky_situation"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Being_employed"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Frequency"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Cardinal_numbers"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Measure_duration"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Working_on"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Temporal_subregion"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z18[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Dangerous_entity","Situation">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc10 := {<"Dangerous_entity","Situation">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
set Exc13 := {<"Degree","Rate">,<"Interval","Salient_entity">,<"Event","Salient_entity">};
subto exclusion13: forall <ri,rj> in Exc13 do z13[ri,"-1_-1"] + z13[rj,"-1_-1"] >= 1;
set Exc16 := {<"Goal","Salient_entity">};
subto exclusion16: forall <ri,rj> in Exc16 do z16[ri,"-1_-1"] + z16[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
