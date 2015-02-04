# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Impression","Intentionally_create","Increment","Dimension","Color","Quantity","Experiencer_focus","Frequency","Vehicle","Hunting_success_or_failure","Bringing","Smuggling","Quantity","Increment","Arriving","Intoxicants","Increment","Legality","Substance"};
set Roles[Frames] :=  <"Impression"> {"Descriptor","Context","Impression","Audience","Figure"}, <"Intentionally_create"> {"Created_entity","Place","Role","Manner","Components","Creator","Time","Means","Purpose","Co_participant"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Color"> {"Type","Attribute","Color","Sub-region","Degree","Comparand","Entity","Descriptor","Cause","Color_qualifier"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Experiencer_focus"> {"Topic","Circumstances","Parameter","Time","Degree","Experiencer","Event","Expressor","Reason","State","Content","Manner"}, <"Frequency"> {"Time_span","Attribute","Degree","Time","Event","Interval","Rate","Salient_entity"}, <"Vehicle"> {"Itinerary","Possessor","Descriptor","Vehicle","Use"}, <"Hunting_success_or_failure"> {"Food","Hunter"}, <"Bringing"> {"Duration","Area","Constant_location","Theme","Means","Depictive","Agent","Manner","Explanation","Distance","Co_participant","Time","Source","Beneficiary","Degree","Place","Frequency","Goal","Purpose","Particular_iteration","Path","Carrier"}, <"Smuggling"> {"Duration","Place","Goal","Goods","Source","Path","Time","Perpetrator","Reason","Means"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Arriving"> {"Theme","Cotheme","Means","Depictive","Circumstances","Manner","Time","Source","Period_of_iterations","Degree","Event_description","Re_encoding","Goal","Purpose","Goal_conditions","Path","Frequency","Mode_of_transportation"}, <"Intoxicants"> {"Country_of_origin","Type","Descriptor","Intoxicant"}, <"Increment"> {"Initial_set","Class","Increment","Added_set"}, <"Legality"> {"Object","Code","Action","Explanation"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"};
set Spans := {"-1_-1","0_0","0_2","0_40","10_10","11_11","12_12","13_13","13_39","14_14","14_39","15_15","16_16","16_39","17_17","17_39","18_18","19_19","1_1","20_20","20_24","21_21","21_24","22_22","23_23","23_24","24_24","25_25","26_26","26_27","26_39","27_27","28_28","28_39","29_29","29_39","2_2","30_30","30_39","31_31","31_39","32_32","32_39","33_33","34_34","34_35","35_35","36_36","37_37","38_38","39_39","3_3","3_40","40_40","4_39","4_4","5_39","5_5","6_39","6_6","7_39","7_7","8_12","8_39","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Impression"]] binary;
var z1[Assignment["Intentionally_create"]] binary;
var z2[Assignment["Increment"]] binary;
var z3[Assignment["Dimension"]] binary;
var z4[Assignment["Color"]] binary;
var z5[Assignment["Quantity"]] binary;
var z6[Assignment["Experiencer_focus"]] binary;
var z7[Assignment["Frequency"]] binary;
var z8[Assignment["Vehicle"]] binary;
var z9[Assignment["Hunting_success_or_failure"]] binary;
var z10[Assignment["Bringing"]] binary;
var z11[Assignment["Smuggling"]] binary;
var z12[Assignment["Quantity"]] binary;
var z13[Assignment["Increment"]] binary;
var z14[Assignment["Arriving"]] binary;
var z15[Assignment["Intoxicants"]] binary;
var z16[Assignment["Increment"]] binary;
var z17[Assignment["Legality"]] binary;
var z18[Assignment["Substance"]] binary;
param probabilities0[Assignment["Impression"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Intentionally_create"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Increment"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Dimension"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Color"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Quantity"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Experiencer_focus"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Frequency"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Vehicle"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Hunting_success_or_failure"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Bringing"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Smuggling"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Quantity"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Increment"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Arriving"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Intoxicants"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Increment"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Legality"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Substance"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Impression"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Intentionally_create"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Color"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Experiencer_focus"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Frequency"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Vehicle"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Hunting_success_or_failure"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Bringing"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Smuggling"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Arriving"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Intoxicants"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Increment"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Legality"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities18[r,s] * z18[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 40};
set G[I] := <0> {"0_0","0_2","0_40"}, <1> {"0_2","0_40","1_1"}, <2> {"0_2","0_40","2_2"}, <3> {"0_40","3_3","3_40"}, <4> {"0_40","3_40","4_39","4_4"}, <5> {"0_40","3_40","4_39","5_39","5_5"}, <6> {"0_40","3_40","4_39","5_39","6_39","6_6"}, <7> {"0_40","3_40","4_39","5_39","6_39","7_39","7_7"}, <8> {"0_40","3_40","4_39","5_39","6_39","7_39","8_12","8_39","8_8"}, <9> {"0_40","3_40","4_39","5_39","6_39","7_39","8_12","8_39","9_9"}, <10> {"0_40","10_10","3_40","4_39","5_39","6_39","7_39","8_12","8_39"}, <11> {"0_40","11_11","3_40","4_39","5_39","6_39","7_39","8_12","8_39"}, <12> {"0_40","12_12","3_40","4_39","5_39","6_39","7_39","8_12","8_39"}, <13> {"0_40","13_13","13_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <14> {"0_40","13_39","14_14","14_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <15> {"0_40","13_39","14_39","15_15","3_40","4_39","5_39","6_39","7_39","8_39"}, <16> {"0_40","13_39","14_39","16_16","16_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <17> {"0_40","13_39","14_39","16_39","17_17","17_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <18> {"0_40","13_39","14_39","16_39","17_39","18_18","3_40","4_39","5_39","6_39","7_39","8_39"}, <19> {"0_40","13_39","14_39","16_39","17_39","19_19","3_40","4_39","5_39","6_39","7_39","8_39"}, <20> {"0_40","13_39","14_39","16_39","17_39","20_20","20_24","3_40","4_39","5_39","6_39","7_39","8_39"}, <21> {"0_40","13_39","14_39","16_39","17_39","20_24","21_21","21_24","3_40","4_39","5_39","6_39","7_39","8_39"}, <22> {"0_40","13_39","14_39","16_39","17_39","20_24","21_24","22_22","3_40","4_39","5_39","6_39","7_39","8_39"}, <23> {"0_40","13_39","14_39","16_39","17_39","20_24","21_24","23_23","23_24","3_40","4_39","5_39","6_39","7_39","8_39"}, <24> {"0_40","13_39","14_39","16_39","17_39","20_24","21_24","23_24","24_24","3_40","4_39","5_39","6_39","7_39","8_39"}, <25> {"0_40","13_39","14_39","16_39","17_39","25_25","3_40","4_39","5_39","6_39","7_39","8_39"}, <26> {"0_40","13_39","14_39","16_39","17_39","26_26","26_27","26_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <27> {"0_40","13_39","14_39","16_39","17_39","26_27","26_39","27_27","3_40","4_39","5_39","6_39","7_39","8_39"}, <28> {"0_40","13_39","14_39","16_39","17_39","26_39","28_28","28_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <29> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_29","29_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <30> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_30","30_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <31> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_31","31_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <32> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_32","32_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <33> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","33_33","3_40","4_39","5_39","6_39","7_39","8_39"}, <34> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","34_34","34_35","3_40","4_39","5_39","6_39","7_39","8_39"}, <35> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","34_35","35_35","3_40","4_39","5_39","6_39","7_39","8_39"}, <36> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","36_36","3_40","4_39","5_39","6_39","7_39","8_39"}, <37> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","37_37","3_40","4_39","5_39","6_39","7_39","8_39"}, <38> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","38_38","3_40","4_39","5_39","6_39","7_39","8_39"}, <39> {"0_40","13_39","14_39","16_39","17_39","26_39","28_39","29_39","30_39","31_39","32_39","39_39","3_40","4_39","5_39","6_39","7_39","8_39"}, <40> {"0_40","3_40","40_40"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Impression"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Intentionally_create"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Color"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Experiencer_focus"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Frequency"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Vehicle"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Hunting_success_or_failure"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Bringing"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Smuggling"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Arriving"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Intoxicants"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Increment"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Legality"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Impression"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Intentionally_create"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Increment"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Dimension"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Color"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Quantity"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Experiencer_focus"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Frequency"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Vehicle"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Hunting_success_or_failure"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Bringing"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Smuggling"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Quantity"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Increment"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Arriving"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Intoxicants"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Increment"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Legality"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Substance"] do sum <s> in Spans : z18[r,s] == 1;
#pairwise exclusion constraint
set Exc5 := {<"Individuals","Mass">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc7 := {<"Degree","Rate">,<"Interval","Salient_entity">,<"Event","Salient_entity">};
subto exclusion7: forall <ri,rj> in Exc7 do z7[ri,"-1_-1"] + z7[rj,"-1_-1"] >= 1;
set Exc10 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
set Exc12 := {<"Individuals","Mass">};
subto exclusion12: forall <ri,rj> in Exc12 do z12[ri,"-1_-1"] + z12[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
