# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Bringing","Commitment","Bringing","Buildings","Containing","Law","Receiving","Natural_features","Calendric_unit","Architectural_part"};
set Roles[Frames] :=  <"Bringing"> {"Duration","Area","Constant_location","Theme","Means","Depictive","Agent","Manner","Explanation","Distance","Co_participant","Time","Source","Beneficiary","Degree","Place","Frequency","Goal","Purpose","Particular_iteration","Path","Carrier"}, <"Commitment"> {"Addressee","Medium","Topic","Manner","Speaker","Time","Message","Purpose"}, <"Bringing"> {"Duration","Area","Constant_location","Theme","Means","Depictive","Agent","Manner","Explanation","Distance","Co_participant","Time","Source","Beneficiary","Degree","Place","Frequency","Goal","Purpose","Particular_iteration","Path","Carrier"}, <"Buildings"> {"Type","Place","Function","Time_of_creation","Relative_location","Name","Building","Descriptor","Material","Builder"}, <"Containing"> {"Container","Time","Contents"}, <"Law"> {"Type","Use","Time_of_creation","Required","Name","Law","Jurisdiction","Forbidden","Creator"}, <"Receiving"> {"Mode_of_transfer","Place","Theme","Path","Manner","Donor","Means","Time","Purpose_of_theme","Countertransfer","Recipient"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Calendric_unit"> {"Relative_time","Unit","Count","Name","Salient_event","Whole"}, <"Architectural_part"> {"Part","Whole","Descriptor","Material","Orientation"};
set Spans := {"-1_-1","0_0","0_2","0_35","0_7","10_10","11_11","12_12","12_17","13_13","13_14","13_17","14_14","15_15","15_17","16_16","16_17","17_17","18_18","19_19","19_21","1_1","20_20","20_21","21_21","22_22","23_23","23_27","24_24","24_25","24_27","25_25","26_26","26_27","27_27","28_28","29_29","29_30","29_34","2_2","30_30","30_34","31_31","31_32","31_34","32_32","33_33","33_34","34_34","35_35","3_3","3_4","3_7","4_4","5_5","5_7","6_6","6_7","7_7","8_8","9_11","9_17","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Bringing"]] binary;
var z1[Assignment["Commitment"]] binary;
var z2[Assignment["Bringing"]] binary;
var z3[Assignment["Buildings"]] binary;
var z4[Assignment["Containing"]] binary;
var z5[Assignment["Law"]] binary;
var z6[Assignment["Receiving"]] binary;
var z7[Assignment["Natural_features"]] binary;
var z8[Assignment["Calendric_unit"]] binary;
var z9[Assignment["Architectural_part"]] binary;
param probabilities0[Assignment["Bringing"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Commitment"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Bringing"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Buildings"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Containing"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Law"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Receiving"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Natural_features"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Calendric_unit"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Architectural_part"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Bringing"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Commitment"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Bringing"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Buildings"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Containing"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Law"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Receiving"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Calendric_unit"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Architectural_part"] : probabilities9[r,s] * z9[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 35};
set G[I] := <0> {"0_0","0_2","0_35","0_7"}, <1> {"0_2","0_35","0_7","1_1"}, <2> {"0_2","0_35","0_7","2_2"}, <3> {"0_35","0_7","3_3","3_4","3_7"}, <4> {"0_35","0_7","3_4","3_7","4_4"}, <5> {"0_35","0_7","3_7","5_5","5_7"}, <6> {"0_35","0_7","3_7","5_7","6_6","6_7"}, <7> {"0_35","0_7","3_7","5_7","6_7","7_7"}, <8> {"0_35","8_8"}, <9> {"0_35","9_11","9_17","9_9"}, <10> {"0_35","10_10","9_11","9_17"}, <11> {"0_35","11_11","9_11","9_17"}, <12> {"0_35","12_12","12_17","9_17"}, <13> {"0_35","12_17","13_13","13_14","13_17","9_17"}, <14> {"0_35","12_17","13_14","13_17","14_14","9_17"}, <15> {"0_35","12_17","13_17","15_15","15_17","9_17"}, <16> {"0_35","12_17","13_17","15_17","16_16","16_17","9_17"}, <17> {"0_35","12_17","13_17","15_17","16_17","17_17","9_17"}, <18> {"0_35","18_18"}, <19> {"0_35","19_19","19_21"}, <20> {"0_35","19_21","20_20","20_21"}, <21> {"0_35","19_21","20_21","21_21"}, <22> {"0_35","22_22"}, <23> {"0_35","23_23","23_27"}, <24> {"0_35","23_27","24_24","24_25","24_27"}, <25> {"0_35","23_27","24_25","24_27","25_25"}, <26> {"0_35","23_27","24_27","26_26","26_27"}, <27> {"0_35","23_27","24_27","26_27","27_27"}, <28> {"0_35","28_28"}, <29> {"0_35","29_29","29_30","29_34"}, <30> {"0_35","29_30","29_34","30_30","30_34"}, <31> {"0_35","29_34","30_34","31_31","31_32","31_34"}, <32> {"0_35","29_34","30_34","31_32","31_34","32_32"}, <33> {"0_35","29_34","30_34","31_34","33_33","33_34"}, <34> {"0_35","29_34","30_34","31_34","33_34","34_34"}, <35> {"0_35","35_35"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Bringing"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Commitment"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Bringing"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Buildings"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Containing"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Law"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Receiving"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Calendric_unit"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Architectural_part"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Bringing"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Commitment"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Bringing"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Buildings"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Containing"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Law"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Receiving"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Calendric_unit"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Architectural_part"] do sum <s> in Spans : z9[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc2 := {<"Area","Source">,<"Area","Goal">,<"Area","Path">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
