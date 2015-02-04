# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Causation","Statement","Exporting","Origin","Weapon","Artifact","Political_locales","Part_orientational","Emotion_directed","Compliance","Being_obligated","Membership","Weapon","Artifact","Control","Leadership"};
set Roles[Frames] :=  <"Causation"> {"Circumstances","Time","Actor","Place","Frequency","Means","Effect","Cause","Reason","Affected","Manner","Concessive","Explanation"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Exporting"> {"Purpose","Type","Exporter","Time","Goods","Path","Re_encoding","Importing_area","Exporting_area","Vehicle","Manner","Explanation"}, <"Origin"> {"Entity","Origin"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Part_orientational"> {"Part_Prop","Part","Whole"}, <"Emotion_directed"> {"Topic","Circumstances","Parameter","Degree","Experiencer","Event","Expressor","Reason","Empathy_target","Manner","State","Stimulus","Frequency"}, <"Compliance"> {"State_of_Affairs","Degree","Manner","Time","Protagonist","Norm","Means","Act"}, <"Being_obligated"> {"Condition","Responsible_party","Place","Frequency","Duty"}, <"Membership"> {"Member","Standing","Group"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"}, <"Control"> {"Manner","Time","Controlling_entity","Dependent_situation","Dependent_entity"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"};
set Spans := {"-1_-1","0_0","0_23","0_46","10_10","10_23","11_11","11_12","11_23","12_12","13_13","13_23","14_14","15_15","16_16","17_17","17_19","17_20","18_18","19_19","1_1","1_23","20_20","21_21","22_22","23_23","24_24","24_46","25_25","25_45","26_26","26_33","27_27","27_33","28_28","28_33","29_29","29_30","29_33","2_2","2_23","2_4","30_30","30_33","31_31","31_33","32_32","32_33","33_33","34_34","34_45","35_35","35_36","35_45","36_36","37_37","37_45","38_38","38_42","38_45","39_39","3_3","40_40","41_41","42_42","43_43","43_44","43_45","44_44","44_45","45_45","46_46","4_4","5_23","5_5","6_23","6_6","6_8","7_7","8_8","9_23","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Causation"]] binary;
var z1[Assignment["Statement"]] binary;
var z2[Assignment["Exporting"]] binary;
var z3[Assignment["Origin"]] binary;
var z4[Assignment["Weapon"]] binary;
var z5[Assignment["Artifact"]] binary;
var z6[Assignment["Political_locales"]] binary;
var z7[Assignment["Part_orientational"]] binary;
var z8[Assignment["Emotion_directed"]] binary;
var z9[Assignment["Compliance"]] binary;
var z10[Assignment["Being_obligated"]] binary;
var z11[Assignment["Membership"]] binary;
var z12[Assignment["Weapon"]] binary;
var z13[Assignment["Artifact"]] binary;
var z14[Assignment["Control"]] binary;
var z15[Assignment["Leadership"]] binary;
param probabilities0[Assignment["Causation"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Statement"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Exporting"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Origin"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Weapon"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Artifact"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Political_locales"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Part_orientational"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Emotion_directed"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Compliance"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Being_obligated"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Membership"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Weapon"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Artifact"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Control"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Leadership"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Causation"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Exporting"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Part_orientational"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Emotion_directed"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Compliance"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Being_obligated"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Membership"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Control"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities15[r,s] * z15[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 46};
set G[I] := <0> {"0_0","0_23","0_46"}, <1> {"0_23","0_46","1_1","1_23"}, <2> {"0_23","0_46","1_23","2_2","2_23","2_4"}, <3> {"0_23","0_46","1_23","2_23","2_4","3_3"}, <4> {"0_23","0_46","1_23","2_23","2_4","4_4"}, <5> {"0_23","0_46","1_23","2_23","5_23","5_5"}, <6> {"0_23","0_46","1_23","2_23","5_23","6_23","6_6","6_8"}, <7> {"0_23","0_46","1_23","2_23","5_23","6_23","6_8","7_7"}, <8> {"0_23","0_46","1_23","2_23","5_23","6_23","6_8","8_8"}, <9> {"0_23","0_46","1_23","2_23","5_23","6_23","9_23","9_9"}, <10> {"0_23","0_46","10_10","10_23","1_23","2_23","5_23","6_23","9_23"}, <11> {"0_23","0_46","10_23","11_11","11_12","11_23","1_23","2_23","5_23","6_23","9_23"}, <12> {"0_23","0_46","10_23","11_12","11_23","12_12","1_23","2_23","5_23","6_23","9_23"}, <13> {"0_23","0_46","10_23","11_23","13_13","13_23","1_23","2_23","5_23","6_23","9_23"}, <14> {"0_23","0_46","10_23","11_23","13_23","14_14","1_23","2_23","5_23","6_23","9_23"}, <15> {"0_23","0_46","10_23","11_23","13_23","15_15","1_23","2_23","5_23","6_23","9_23"}, <16> {"0_23","0_46","10_23","11_23","13_23","16_16","1_23","2_23","5_23","6_23","9_23"}, <17> {"0_23","0_46","10_23","11_23","13_23","17_17","17_19","17_20","1_23","2_23","5_23","6_23","9_23"}, <18> {"0_23","0_46","10_23","11_23","13_23","17_19","17_20","18_18","1_23","2_23","5_23","6_23","9_23"}, <19> {"0_23","0_46","10_23","11_23","13_23","17_19","17_20","19_19","1_23","2_23","5_23","6_23","9_23"}, <20> {"0_23","0_46","10_23","11_23","13_23","17_20","1_23","20_20","2_23","5_23","6_23","9_23"}, <21> {"0_23","0_46","10_23","11_23","13_23","1_23","21_21","2_23","5_23","6_23","9_23"}, <22> {"0_23","0_46","10_23","11_23","13_23","1_23","22_22","2_23","5_23","6_23","9_23"}, <23> {"0_23","0_46","10_23","11_23","13_23","1_23","23_23","2_23","5_23","6_23","9_23"}, <24> {"0_46","24_24","24_46"}, <25> {"0_46","24_46","25_25","25_45"}, <26> {"0_46","24_46","25_45","26_26","26_33"}, <27> {"0_46","24_46","25_45","26_33","27_27","27_33"}, <28> {"0_46","24_46","25_45","26_33","27_33","28_28","28_33"}, <29> {"0_46","24_46","25_45","26_33","27_33","28_33","29_29","29_30","29_33"}, <30> {"0_46","24_46","25_45","26_33","27_33","28_33","29_30","29_33","30_30","30_33"}, <31> {"0_46","24_46","25_45","26_33","27_33","28_33","29_33","30_33","31_31","31_33"}, <32> {"0_46","24_46","25_45","26_33","27_33","28_33","29_33","30_33","31_33","32_32","32_33"}, <33> {"0_46","24_46","25_45","26_33","27_33","28_33","29_33","30_33","31_33","32_33","33_33"}, <34> {"0_46","24_46","25_45","34_34","34_45"}, <35> {"0_46","24_46","25_45","34_45","35_35","35_36","35_45"}, <36> {"0_46","24_46","25_45","34_45","35_36","35_45","36_36"}, <37> {"0_46","24_46","25_45","34_45","35_45","37_37","37_45"}, <38> {"0_46","24_46","25_45","34_45","35_45","37_45","38_38","38_42","38_45"}, <39> {"0_46","24_46","25_45","34_45","35_45","37_45","38_42","38_45","39_39"}, <40> {"0_46","24_46","25_45","34_45","35_45","37_45","38_42","38_45","40_40"}, <41> {"0_46","24_46","25_45","34_45","35_45","37_45","38_42","38_45","41_41"}, <42> {"0_46","24_46","25_45","34_45","35_45","37_45","38_42","38_45","42_42"}, <43> {"0_46","24_46","25_45","34_45","35_45","37_45","38_45","43_43","43_44","43_45"}, <44> {"0_46","24_46","25_45","34_45","35_45","37_45","38_45","43_44","43_45","44_44","44_45"}, <45> {"0_46","24_46","25_45","34_45","35_45","37_45","38_45","43_45","44_45","45_45"}, <46> {"0_46","24_46","46_46"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Causation"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Exporting"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Part_orientational"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Emotion_directed"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Compliance"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Being_obligated"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Membership"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Control"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Causation"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Statement"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Exporting"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Origin"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Weapon"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Artifact"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Part_orientational"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Emotion_directed"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Compliance"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Being_obligated"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Membership"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Weapon"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Artifact"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Control"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Leadership"] do sum <s> in Spans : z15[r,s] == 1;
#pairwise exclusion constraint
set Exc8 := {<"Event","Experiencer">,<"Experiencer","Expressor">,<"Event","Expressor">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
