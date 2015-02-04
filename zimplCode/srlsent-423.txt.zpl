# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Weapon","Manufacturing","Attempt","Political_locales","Manufacturing","Capability","Quantity","Distinctiveness","Project","State_continue","Contingency","Foreign_or_domestic_country","Source_of_getting","Substance","Hostile_encounter","Cognitive_connection","Artifact"};
set Roles[Frames] :=  <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Attempt"> {"Purpose","Circumstances","Time","Goal","Particular_iteration","Place","Frequency","Degree","Means","Outcome","Condition","Depictive","Duration","Manner","Agent"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Distinctiveness"> {"Feature","Degree","Duration","Entity"}, <"Project"> {"Salient_entity","Duration","Agent","Goal","Manner","Name","Project","Field","Descriptor","Activity"}, <"State_continue"> {"Explanation","Time","Entity","Duration","Place","State"}, <"Contingency"> {"Circumstances","Determinant","Outcome","Degree"}, <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Source_of_getting"> {"Goal","Theme","Descriptor","Source"}, <"Substance"> {"Source","Type","Use","Descriptor","Substance","Constituents"}, <"Hostile_encounter"> {"Purpose","Result","Depictive","Instrument","Place","Degree","Means","Internal_cause","Reason","Particular_iteration","Duration","Sides","Issue","Side_2","Side_1","Manner","Time"}, <"Cognitive_connection"> {"Point_of_view","Circumstances","Specification","Concept_2","Concept_1","Degree","Concepts"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"};
set Spans := {"-1_-1","0_0","0_20","0_34","10_10","11_11","12_12","13_13","13_20","14_14","14_15","14_20","15_15","16_16","16_20","17_17","17_20","18_18","19_19","1_1","1_2","1_20","20_20","21_21","22_22","23_23","24_24","24_33","25_25","25_33","26_26","26_27","26_33","27_27","28_28","28_33","29_29","29_30","29_33","2_2","2_20","30_30","31_31","32_32","33_33","34_34","3_20","3_3","4_20","4_4","4_6","5_5","6_6","7_20","7_7","7_8","8_20","8_8","9_12","9_20","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Weapon"]] binary;
var z1[Assignment["Manufacturing"]] binary;
var z2[Assignment["Attempt"]] binary;
var z3[Assignment["Political_locales"]] binary;
var z4[Assignment["Manufacturing"]] binary;
var z5[Assignment["Capability"]] binary;
var z6[Assignment["Quantity"]] binary;
var z7[Assignment["Distinctiveness"]] binary;
var z8[Assignment["Project"]] binary;
var z9[Assignment["State_continue"]] binary;
var z10[Assignment["Contingency"]] binary;
var z11[Assignment["Foreign_or_domestic_country"]] binary;
var z12[Assignment["Source_of_getting"]] binary;
var z13[Assignment["Substance"]] binary;
var z14[Assignment["Hostile_encounter"]] binary;
var z15[Assignment["Cognitive_connection"]] binary;
var z16[Assignment["Artifact"]] binary;
param probabilities0[Assignment["Weapon"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Manufacturing"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Attempt"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Political_locales"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Manufacturing"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Capability"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Quantity"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Distinctiveness"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Project"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["State_continue"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Contingency"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Source_of_getting"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Substance"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Hostile_encounter"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Cognitive_connection"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Artifact"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Weapon"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Attempt"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Distinctiveness"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Project"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["State_continue"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Contingency"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Source_of_getting"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Substance"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Hostile_encounter"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Cognitive_connection"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities16[r,s] * z16[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 34};
set G[I] := <0> {"0_0","0_20","0_34"}, <1> {"0_20","0_34","1_1","1_2","1_20"}, <2> {"0_20","0_34","1_2","1_20","2_2","2_20"}, <3> {"0_20","0_34","1_20","2_20","3_20","3_3"}, <4> {"0_20","0_34","1_20","2_20","3_20","4_20","4_4","4_6"}, <5> {"0_20","0_34","1_20","2_20","3_20","4_20","4_6","5_5"}, <6> {"0_20","0_34","1_20","2_20","3_20","4_20","4_6","6_6"}, <7> {"0_20","0_34","1_20","2_20","3_20","4_20","7_20","7_7","7_8"}, <8> {"0_20","0_34","1_20","2_20","3_20","4_20","7_20","7_8","8_20","8_8"}, <9> {"0_20","0_34","1_20","2_20","3_20","4_20","7_20","8_20","9_12","9_20","9_9"}, <10> {"0_20","0_34","10_10","1_20","2_20","3_20","4_20","7_20","8_20","9_12","9_20"}, <11> {"0_20","0_34","11_11","1_20","2_20","3_20","4_20","7_20","8_20","9_12","9_20"}, <12> {"0_20","0_34","12_12","1_20","2_20","3_20","4_20","7_20","8_20","9_12","9_20"}, <13> {"0_20","0_34","13_13","13_20","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <14> {"0_20","0_34","13_20","14_14","14_15","14_20","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <15> {"0_20","0_34","13_20","14_15","14_20","15_15","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <16> {"0_20","0_34","13_20","14_20","16_16","16_20","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <17> {"0_20","0_34","13_20","14_20","16_20","17_17","17_20","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <18> {"0_20","0_34","13_20","14_20","16_20","17_20","18_18","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <19> {"0_20","0_34","13_20","14_20","16_20","17_20","19_19","1_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <20> {"0_20","0_34","13_20","14_20","16_20","17_20","1_20","20_20","2_20","3_20","4_20","7_20","8_20","9_20"}, <21> {"0_34","21_21"}, <22> {"0_34","22_22"}, <23> {"0_34","23_23"}, <24> {"0_34","24_24","24_33"}, <25> {"0_34","24_33","25_25","25_33"}, <26> {"0_34","24_33","25_33","26_26","26_27","26_33"}, <27> {"0_34","24_33","25_33","26_27","26_33","27_27"}, <28> {"0_34","24_33","25_33","26_33","28_28","28_33"}, <29> {"0_34","24_33","25_33","26_33","28_33","29_29","29_30","29_33"}, <30> {"0_34","24_33","25_33","26_33","28_33","29_30","29_33","30_30"}, <31> {"0_34","24_33","25_33","26_33","28_33","29_33","31_31"}, <32> {"0_34","24_33","25_33","26_33","28_33","29_33","32_32"}, <33> {"0_34","24_33","25_33","26_33","28_33","29_33","33_33"}, <34> {"0_34","34_34"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Attempt"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Distinctiveness"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Project"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["State_continue"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Contingency"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Source_of_getting"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Substance"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Hostile_encounter"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Cognitive_connection"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Weapon"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Attempt"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Capability"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Quantity"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Distinctiveness"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Project"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["State_continue"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Contingency"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Source_of_getting"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Substance"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Hostile_encounter"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Cognitive_connection"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Artifact"] do sum <s> in Spans : z16[r,s] == 1;
#pairwise exclusion constraint
set Exc6 := {<"Individuals","Mass">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc8 := {<"Activity","Salient_entity">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
set Exc14 := {<"Side_1","Sides">,<"Side_2","Sides">};
subto exclusion14: forall <ri,rj> in Exc14 do z14[ri,"-1_-1"] + z14[rj,"-1_-1"] >= 1;
set Exc15 := {<"Concept_2","Concepts">,<"Concept_1","Concepts">};
subto exclusion15: forall <ri,rj> in Exc15 do z15[ri,"-1_-1"] + z15[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr14 := {<"Side_1","Side_2">};
subto require14: forall <ri,rj> in Reqr14 do z14[ri,"-1_-1"] - z14[rj,"-1_-1"] == 0;