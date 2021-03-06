# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Weapon","Part_orientational","Reason","Part_orientational","Political_locales","Recording","Exporting","Weapon","Manufacturing","Artifact","Evidence","Part_orientational","Capability","Willingness","Commerce_sell","Weapon","Ingredients","Artifact","Completeness"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Reason"> {"Action","State_of_Affairs","Agent"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Recording"> {"Value","Time","Instrument","Place","Frequency","Degree","Language","Period_of_iterations","Phenomenon","Duration","Attribute","Manner","Agent","Medium"}, <"Exporting"> {"Purpose","Type","Exporter","Time","Goods","Path","Re_encoding","Importing_area","Exporting_area","Vehicle","Manner","Explanation"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Evidence"> {"Domain_of_Relevance","Support","Manner","Depictive","Proposition","Degree","Cognizer"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Willingness"> {"Explanation","Time","Activity","Degree","Frequency","Cognizer"}, <"Commerce_sell"> {"Purpose","Result","Unit","Purpose_of_Goods","Goods","Place","Seller","Rate","Manner","Relay","Buyer","Means","Time","Money"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Ingredients"> {"Source","Type","Use","Material","Product","Descriptor"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Completeness"> {"Degree","Whole","Time"};
set Spans := {"-1_-1","0_0","0_11","0_23","0_44","10_10","11_11","12_12","13_13","13_14","14_14","15_15","15_19","16_16","16_19","17_17","17_19","18_18","18_19","19_19","1_1","1_11","20_20","21_21","22_22","23_23","24_24","24_44","25_25","25_43","26_26","26_27","26_43","27_27","28_28","28_43","29_29","2_11","2_2","2_3","2_4","30_30","30_43","31_31","31_43","32_32","32_33","32_43","33_33","33_43","34_34","34_35","34_40","34_41","34_43","35_35","36_36","37_37","38_38","39_39","3_3","40_40","41_41","42_42","43_43","44_44","4_11","4_4","5_11","5_5","6_11","6_6","6_7","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Weapon"]] binary;
var z2[Assignment["Part_orientational"]] binary;
var z3[Assignment["Reason"]] binary;
var z4[Assignment["Part_orientational"]] binary;
var z5[Assignment["Political_locales"]] binary;
var z6[Assignment["Recording"]] binary;
var z7[Assignment["Exporting"]] binary;
var z8[Assignment["Weapon"]] binary;
var z9[Assignment["Manufacturing"]] binary;
var z10[Assignment["Artifact"]] binary;
var z11[Assignment["Evidence"]] binary;
var z12[Assignment["Part_orientational"]] binary;
var z13[Assignment["Capability"]] binary;
var z14[Assignment["Willingness"]] binary;
var z15[Assignment["Commerce_sell"]] binary;
var z16[Assignment["Weapon"]] binary;
var z17[Assignment["Ingredients"]] binary;
var z18[Assignment["Artifact"]] binary;
var z19[Assignment["Completeness"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Weapon"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Part_orientational"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Reason"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Part_orientational"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Political_locales"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Recording"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Exporting"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Weapon"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Manufacturing"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Artifact"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Evidence"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Part_orientational"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Capability"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Willingness"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Commerce_sell"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Weapon"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Ingredients"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Artifact"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;
param probabilities19[Assignment["Completeness"]] := read "../frameData/frame19.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Reason"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Recording"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Exporting"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Evidence"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Willingness"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Commerce_sell"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Ingredients"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities18[r,s] * z18[r,s])+(sum <r,s> in Assignment["Completeness"] : probabilities19[r,s] * z19[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 44};
set G[I] := <0> {"0_0","0_11","0_23","0_44"}, <1> {"0_11","0_23","0_44","1_1","1_11"}, <2> {"0_11","0_23","0_44","1_11","2_11","2_2","2_3","2_4"}, <3> {"0_11","0_23","0_44","1_11","2_11","2_3","2_4","3_3"}, <4> {"0_11","0_23","0_44","1_11","2_11","2_4","4_11","4_4"}, <5> {"0_11","0_23","0_44","1_11","2_11","4_11","5_11","5_5"}, <6> {"0_11","0_23","0_44","1_11","2_11","4_11","5_11","6_11","6_6","6_7"}, <7> {"0_11","0_23","0_44","1_11","2_11","4_11","5_11","6_11","6_7","7_7"}, <8> {"0_11","0_23","0_44","1_11","2_11","4_11","5_11","6_11","8_8"}, <9> {"0_11","0_23","0_44","1_11","2_11","4_11","5_11","6_11","9_9"}, <10> {"0_11","0_23","0_44","10_10","1_11","2_11","4_11","5_11","6_11"}, <11> {"0_11","0_23","0_44","11_11","1_11","2_11","4_11","5_11","6_11"}, <12> {"0_23","0_44","12_12"}, <13> {"0_23","0_44","13_13","13_14"}, <14> {"0_23","0_44","13_14","14_14"}, <15> {"0_23","0_44","15_15","15_19"}, <16> {"0_23","0_44","15_19","16_16","16_19"}, <17> {"0_23","0_44","15_19","16_19","17_17","17_19"}, <18> {"0_23","0_44","15_19","16_19","17_19","18_18","18_19"}, <19> {"0_23","0_44","15_19","16_19","17_19","18_19","19_19"}, <20> {"0_23","0_44","20_20"}, <21> {"0_23","0_44","21_21"}, <22> {"0_23","0_44","22_22"}, <23> {"0_23","0_44","23_23"}, <24> {"0_44","24_24","24_44"}, <25> {"0_44","24_44","25_25","25_43"}, <26> {"0_44","24_44","25_43","26_26","26_27","26_43"}, <27> {"0_44","24_44","25_43","26_27","26_43","27_27"}, <28> {"0_44","24_44","25_43","26_43","28_28","28_43"}, <29> {"0_44","24_44","25_43","26_43","28_43","29_29"}, <30> {"0_44","24_44","25_43","26_43","28_43","30_30","30_43"}, <31> {"0_44","24_44","25_43","26_43","28_43","30_43","31_31","31_43"}, <32> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_32","32_33","32_43"}, <33> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_33","32_43","33_33","33_43"}, <34> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_34","34_35","34_40","34_41","34_43"}, <35> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_35","34_40","34_41","34_43","35_35"}, <36> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_40","34_41","34_43","36_36"}, <37> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_40","34_41","34_43","37_37"}, <38> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_40","34_41","34_43","38_38"}, <39> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_40","34_41","34_43","39_39"}, <40> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_40","34_41","34_43","40_40"}, <41> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_41","34_43","41_41"}, <42> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_43","42_42"}, <43> {"0_44","24_44","25_43","26_43","28_43","30_43","31_43","32_43","33_43","34_43","43_43"}, <44> {"0_44","24_44","44_44"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Reason"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Recording"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Exporting"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Evidence"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Willingness"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Commerce_sell"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Ingredients"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
subto overlap19: forall <i> in I do 
 sum <r> in Roles["Completeness"] do 
 sum <s> in G[i] do z19[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Weapon"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Reason"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Recording"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Exporting"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Weapon"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Artifact"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Evidence"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Capability"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Willingness"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Commerce_sell"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Weapon"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Ingredients"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Artifact"] do sum <s> in Spans : z18[r,s] == 1;
subto unique19: forall <r> in Roles["Completeness"] do sum <s> in Spans : z19[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Phenomenon","Value">,<"Attribute","Phenomenon">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
