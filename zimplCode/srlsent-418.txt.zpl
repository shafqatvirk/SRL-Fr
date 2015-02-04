# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Statement","Statement","Statement","Respond_to_proposal","Origin","Time_vector","Military","Leadership","Employing","Commerce_buy","Weapon","Artifact"};
set Roles[Frames] :=  <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Respond_to_proposal"> {"Proposal","Explanation","Time","Group","Speaker","Iteration","Manner","Interlocutor"}, <"Origin"> {"Entity","Origin"}, <"Time_vector"> {"Distance","Event","Landmark_event","Direction"}, <"Military"> {"Members","Descriptor","Possessor","Goal","Domain","Force"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Employing"> {"Purpose","Time","Descriptor","Place","Field","Task","Employer","Compensation","Position","Manner","Contract_basis","Employee"}, <"Commerce_buy"> {"Recipient","Time","Goods","Place","Purpose_of_goods","Seller","Purpose","Rate","Manner","Buyer","Means","Money"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Artifact"> {"Creator","Type","Use","Material","Time_of_creation","Name","Artifact"};
set Spans := {"-1_-1","0_0","0_28","10_10","10_27","11_11","11_27","12_12","13_13","14_14","14_20","15_15","15_18","15_20","16_16","17_17","18_18","19_19","19_20","1_1","1_28","20_20","21_21","21_23","21_25","21_27","22_22","23_23","24_24","25_25","26_26","26_27","27_27","28_28","2_2","2_3","3_3","4_4","5_5","6_27","6_6","7_27","7_7","8_27","8_8","8_9","9_27","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Statement"]] binary;
var z1[Assignment["Statement"]] binary;
var z2[Assignment["Statement"]] binary;
var z3[Assignment["Respond_to_proposal"]] binary;
var z4[Assignment["Origin"]] binary;
var z5[Assignment["Time_vector"]] binary;
var z6[Assignment["Military"]] binary;
var z7[Assignment["Leadership"]] binary;
var z8[Assignment["Employing"]] binary;
var z9[Assignment["Commerce_buy"]] binary;
var z10[Assignment["Weapon"]] binary;
var z11[Assignment["Artifact"]] binary;
param probabilities0[Assignment["Statement"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Statement"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Statement"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Respond_to_proposal"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Origin"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Time_vector"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Military"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Leadership"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Employing"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Commerce_buy"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Weapon"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Artifact"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Statement"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Respond_to_proposal"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Time_vector"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Military"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Employing"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Commerce_buy"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Artifact"] : probabilities11[r,s] * z11[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 28};
set G[I] := <0> {"0_0","0_28"}, <1> {"0_28","1_1","1_28"}, <2> {"0_28","1_28","2_2","2_3"}, <3> {"0_28","1_28","2_3","3_3"}, <4> {"0_28","1_28","4_4"}, <5> {"0_28","1_28","5_5"}, <6> {"0_28","1_28","6_27","6_6"}, <7> {"0_28","1_28","6_27","7_27","7_7"}, <8> {"0_28","1_28","6_27","7_27","8_27","8_8","8_9"}, <9> {"0_28","1_28","6_27","7_27","8_27","8_9","9_27","9_9"}, <10> {"0_28","10_10","10_27","1_28","6_27","7_27","8_27","9_27"}, <11> {"0_28","10_27","11_11","11_27","1_28","6_27","7_27","8_27","9_27"}, <12> {"0_28","10_27","11_27","12_12","1_28","6_27","7_27","8_27","9_27"}, <13> {"0_28","10_27","11_27","13_13","1_28","6_27","7_27","8_27","9_27"}, <14> {"0_28","10_27","11_27","14_14","14_20","1_28","6_27","7_27","8_27","9_27"}, <15> {"0_28","10_27","11_27","14_20","15_15","15_18","15_20","1_28","6_27","7_27","8_27","9_27"}, <16> {"0_28","10_27","11_27","14_20","15_18","15_20","16_16","1_28","6_27","7_27","8_27","9_27"}, <17> {"0_28","10_27","11_27","14_20","15_18","15_20","17_17","1_28","6_27","7_27","8_27","9_27"}, <18> {"0_28","10_27","11_27","14_20","15_18","15_20","18_18","1_28","6_27","7_27","8_27","9_27"}, <19> {"0_28","10_27","11_27","14_20","15_20","19_19","19_20","1_28","6_27","7_27","8_27","9_27"}, <20> {"0_28","10_27","11_27","14_20","15_20","19_20","1_28","20_20","6_27","7_27","8_27","9_27"}, <21> {"0_28","10_27","11_27","1_28","21_21","21_23","21_25","21_27","6_27","7_27","8_27","9_27"}, <22> {"0_28","10_27","11_27","1_28","21_23","21_25","21_27","22_22","6_27","7_27","8_27","9_27"}, <23> {"0_28","10_27","11_27","1_28","21_23","21_25","21_27","23_23","6_27","7_27","8_27","9_27"}, <24> {"0_28","10_27","11_27","1_28","21_25","21_27","24_24","6_27","7_27","8_27","9_27"}, <25> {"0_28","10_27","11_27","1_28","21_25","21_27","25_25","6_27","7_27","8_27","9_27"}, <26> {"0_28","10_27","11_27","1_28","21_27","26_26","26_27","6_27","7_27","8_27","9_27"}, <27> {"0_28","10_27","11_27","1_28","21_27","26_27","27_27","6_27","7_27","8_27","9_27"}, <28> {"0_28","1_28","28_28"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Respond_to_proposal"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Time_vector"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Military"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Employing"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Commerce_buy"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Artifact"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Statement"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Statement"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Statement"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Respond_to_proposal"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Origin"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Time_vector"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Military"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Leadership"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Employing"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Commerce_buy"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Weapon"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Artifact"] do sum <s> in Spans : z11[r,s] == 1;
#pairwise exclusion constraint
#pairwise requirement constraint
