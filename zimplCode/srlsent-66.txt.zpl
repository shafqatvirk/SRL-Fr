# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Ordinal_numbers","Dimension","Natural_features","Locative_relation","Measure_linear_extent","Dimension","Measure_linear_extent","Dimension","Locale"};
set Roles[Frames] :=  <"Ordinal_numbers"> {"Type","Item","Starting_point","Comparison_set","Basis_of_order"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Natural_features"> {"Type","Locale","Relative_location","Name","Formational_cause","Container_possessor","Constituent_parts","Descriptor"}, <"Locative_relation"> {"Time","Distance","Figure","Ground","Direction","Figures"}, <"Measure_linear_extent"> {"Count","Dimension","Unit","Stuff"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Measure_linear_extent"> {"Count","Dimension","Unit","Stuff"}, <"Dimension"> {"Object","Domain","Measurement","Dimension","Location"}, <"Locale"> {"Formational_cause","Locale","Relative_location","Name","Container_possessor","Related_event","Constituent_parts","Descriptor"};
set Spans := {"-1_-1","0_0","0_36","0_8","10_10","11_11","11_12","12_12","13_13","14_14","15_15","16_16","16_35","17_17","17_35","18_18","18_20","18_21","19_19","1_1","20_20","21_21","22_22","22_30","23_23","23_26","23_30","24_24","25_25","26_26","27_27","27_29","27_30","28_28","29_29","2_2","30_30","31_31","31_35","32_32","32_35","33_33","33_35","34_34","35_35","36_36","3_3","4_4","5_5","5_7","6_6","6_7","7_7","8_8","9_12","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Ordinal_numbers"]] binary;
var z1[Assignment["Dimension"]] binary;
var z2[Assignment["Natural_features"]] binary;
var z3[Assignment["Locative_relation"]] binary;
var z4[Assignment["Measure_linear_extent"]] binary;
var z5[Assignment["Dimension"]] binary;
var z6[Assignment["Measure_linear_extent"]] binary;
var z7[Assignment["Dimension"]] binary;
var z8[Assignment["Locale"]] binary;
param probabilities0[Assignment["Ordinal_numbers"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Dimension"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Natural_features"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Locative_relation"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Measure_linear_extent"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Dimension"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Measure_linear_extent"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Dimension"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Locale"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Ordinal_numbers"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Natural_features"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Locative_relation"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Measure_linear_extent"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Measure_linear_extent"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Dimension"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Locale"] : probabilities8[r,s] * z8[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 36};
set G[I] := <0> {"0_0","0_36","0_8"}, <1> {"0_36","0_8","1_1"}, <2> {"0_36","0_8","2_2"}, <3> {"0_36","0_8","3_3"}, <4> {"0_36","0_8","4_4"}, <5> {"0_36","0_8","5_5","5_7"}, <6> {"0_36","0_8","5_7","6_6","6_7"}, <7> {"0_36","0_8","5_7","6_7","7_7"}, <8> {"0_36","0_8","8_8"}, <9> {"0_36","9_12","9_9"}, <10> {"0_36","10_10","9_12"}, <11> {"0_36","11_11","11_12","9_12"}, <12> {"0_36","11_12","12_12","9_12"}, <13> {"0_36","13_13"}, <14> {"0_36","14_14"}, <15> {"0_36","15_15"}, <16> {"0_36","16_16","16_35"}, <17> {"0_36","16_35","17_17","17_35"}, <18> {"0_36","16_35","17_35","18_18","18_20","18_21"}, <19> {"0_36","16_35","17_35","18_20","18_21","19_19"}, <20> {"0_36","16_35","17_35","18_20","18_21","20_20"}, <21> {"0_36","16_35","17_35","18_21","21_21"}, <22> {"0_36","16_35","17_35","22_22","22_30"}, <23> {"0_36","16_35","17_35","22_30","23_23","23_26","23_30"}, <24> {"0_36","16_35","17_35","22_30","23_26","23_30","24_24"}, <25> {"0_36","16_35","17_35","22_30","23_26","23_30","25_25"}, <26> {"0_36","16_35","17_35","22_30","23_26","23_30","26_26"}, <27> {"0_36","16_35","17_35","22_30","23_30","27_27","27_29","27_30"}, <28> {"0_36","16_35","17_35","22_30","23_30","27_29","27_30","28_28"}, <29> {"0_36","16_35","17_35","22_30","23_30","27_29","27_30","29_29"}, <30> {"0_36","16_35","17_35","22_30","23_30","27_30","30_30"}, <31> {"0_36","16_35","17_35","31_31","31_35"}, <32> {"0_36","16_35","17_35","31_35","32_32","32_35"}, <33> {"0_36","16_35","17_35","31_35","32_35","33_33","33_35"}, <34> {"0_36","16_35","17_35","31_35","32_35","33_35","34_34"}, <35> {"0_36","16_35","17_35","31_35","32_35","33_35","35_35"}, <36> {"0_36","36_36"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Ordinal_numbers"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Natural_features"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Locative_relation"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Measure_linear_extent"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Measure_linear_extent"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Dimension"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Locale"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Ordinal_numbers"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Dimension"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Natural_features"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Locative_relation"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Measure_linear_extent"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Dimension"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Measure_linear_extent"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Dimension"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Locale"] do sum <s> in Spans : z8[r,s] == 1;
#pairwise exclusion constraint
set Exc0 := {<"Basis_of_order","Starting_point">};
subto exclusion0: forall <ri,rj> in Exc0 do z0[ri,"-1_-1"] + z0[rj,"-1_-1"] >= 1;
set Exc3 := {<"Figure","Figures">,<"Figures","Ground">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
