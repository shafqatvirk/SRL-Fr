# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Activity_ongoing","Compliance","Commitment","Cause_to_end","Quantity","Weapon","Collaboration","Relative_time","Position_on_a_scale","Statement","Adducing","Organization","Source_of_getting","Reveal_secret","Relational_quantity","Process_continue","Origin","Weapon","Collaboration","Intentionally_act"};
set Roles[Frames] :=  <"Activity_ongoing"> {"Purpose","Circumstances","Depictive","Activity","Event_description","Duration","Manner","Time","Explanation","Means","Subevent","Agent"}, <"Compliance"> {"State_of_Affairs","Degree","Manner","Time","Protagonist","Norm","Means","Act"}, <"Commitment"> {"Addressee","Medium","Topic","Manner","Speaker","Time","Message","Purpose"}, <"Cause_to_end"> {"Place","Agent","Degree","Manner","Time","Reason","Means","Process","State","Cause"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Collaboration"> {"Duration","Place","Undertaking","Partner_2","Partner_1","Time","Partners","Manner","Degree"}, <"Relative_time"> {"Focal_participant","Interval","Degree","Focal_occasion","Landmark_occasion"}, <"Position_on_a_scale"> {"Domain","Value","Item","Variable","Degree"}, <"Statement"> {"Message","Medium","Place","Iteration","Means","Depictive","Manner","Epistemic_stance","Speaker","Event_description","Addressee","Time","Containing_event","Degree","Occasion","Group","Frequency","Particular_iteration","Internal_cause","Topic"}, <"Adducing"> {"Purpose","Circumstances","Depictive","Containing_event","Place","Addressee","Means","Role","Event_description","Frequency","Explanation","Manner","Specified_entity","Speaker","Time","Medium"}, <"Organization"> {"Period_of_existence","Members","Place","Name","Container_possessor","Organization","Purpose","Descriptor"}, <"Source_of_getting"> {"Goal","Theme","Descriptor","Source"}, <"Reveal_secret"> {"Medium","Place","Means","Depictive","Speaker","Location_of_protagonist","Manner","Completeness","Period_of_iterations","Information","Addressee","Time","Containing_event","Event_description","Frequency","Re-encoding","Internal_cause","Topic","Source_material"}, <"Relational_quantity"> {"Mass","Denoted_quantity","Reference_quantity","Individuals"}, <"Process_continue"> {"Duration","Place","Manner","Time","Circumstances","Depictive","Event","Concessive"}, <"Origin"> {"Entity","Origin"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Collaboration"> {"Duration","Place","Undertaking","Partner_2","Partner_1","Time","Partners","Manner","Degree"}, <"Intentionally_act"> {"Purpose","Result","Time","Place","Frequency","Means","Event_dscription","Period_of_iterations","Domain","Act","Particular_iteration","Manner","Explanation","Agent"};
set Spans := {"-1_-1","0_0","0_14","0_31","10_10","10_12","10_14","11_11","12_12","13_13","13_14","14_14","15_15","16_16","16_18","16_21","17_17","18_18","19_19","19_21","1_1","1_14","1_2","20_20","20_21","21_21","22_22","23_23","23_25","23_30","24_24","25_25","26_26","27_27","28_28","29_29","2_14","2_2","30_30","31_31","3_14","3_3","3_4","4_14","4_4","5_14","5_5","6_14","6_6","6_7","7_14","7_7","8_14","8_8","8_9","9_14","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Activity_ongoing"]] binary;
var z1[Assignment["Compliance"]] binary;
var z2[Assignment["Commitment"]] binary;
var z3[Assignment["Cause_to_end"]] binary;
var z4[Assignment["Quantity"]] binary;
var z5[Assignment["Weapon"]] binary;
var z6[Assignment["Collaboration"]] binary;
var z7[Assignment["Relative_time"]] binary;
var z8[Assignment["Position_on_a_scale"]] binary;
var z9[Assignment["Statement"]] binary;
var z10[Assignment["Adducing"]] binary;
var z11[Assignment["Organization"]] binary;
var z12[Assignment["Source_of_getting"]] binary;
var z13[Assignment["Reveal_secret"]] binary;
var z14[Assignment["Relational_quantity"]] binary;
var z15[Assignment["Process_continue"]] binary;
var z16[Assignment["Origin"]] binary;
var z17[Assignment["Weapon"]] binary;
var z18[Assignment["Collaboration"]] binary;
var z19[Assignment["Intentionally_act"]] binary;
param probabilities0[Assignment["Activity_ongoing"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Compliance"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Commitment"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Cause_to_end"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Quantity"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Weapon"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Collaboration"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Relative_time"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Position_on_a_scale"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Statement"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Adducing"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Organization"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Source_of_getting"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Reveal_secret"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Relational_quantity"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Process_continue"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Origin"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Weapon"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Collaboration"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;
param probabilities19[Assignment["Intentionally_act"]] := read "../frameData/frame19.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Activity_ongoing"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Compliance"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Commitment"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Cause_to_end"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Collaboration"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Relative_time"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Position_on_a_scale"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Statement"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Adducing"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Organization"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Source_of_getting"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Reveal_secret"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Relational_quantity"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Process_continue"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Origin"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Collaboration"] : probabilities18[r,s] * z18[r,s])+(sum <r,s> in Assignment["Intentionally_act"] : probabilities19[r,s] * z19[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 31};
set G[I] := <0> {"0_0","0_14","0_31"}, <1> {"0_14","0_31","1_1","1_14","1_2"}, <2> {"0_14","0_31","1_14","1_2","2_14","2_2"}, <3> {"0_14","0_31","1_14","2_14","3_14","3_3","3_4"}, <4> {"0_14","0_31","1_14","2_14","3_14","3_4","4_14","4_4"}, <5> {"0_14","0_31","1_14","2_14","3_14","4_14","5_14","5_5"}, <6> {"0_14","0_31","1_14","2_14","3_14","4_14","5_14","6_14","6_6","6_7"}, <7> {"0_14","0_31","1_14","2_14","3_14","4_14","5_14","6_14","6_7","7_14","7_7"}, <8> {"0_14","0_31","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","8_8","8_9"}, <9> {"0_14","0_31","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","8_9","9_14","9_9"}, <10> {"0_14","0_31","10_10","10_12","10_14","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","9_14"}, <11> {"0_14","0_31","10_12","10_14","11_11","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","9_14"}, <12> {"0_14","0_31","10_12","10_14","12_12","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","9_14"}, <13> {"0_14","0_31","10_14","13_13","13_14","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","9_14"}, <14> {"0_14","0_31","10_14","13_14","14_14","1_14","2_14","3_14","4_14","5_14","6_14","7_14","8_14","9_14"}, <15> {"0_31","15_15"}, <16> {"0_31","16_16","16_18","16_21"}, <17> {"0_31","16_18","16_21","17_17"}, <18> {"0_31","16_18","16_21","18_18"}, <19> {"0_31","16_21","19_19","19_21"}, <20> {"0_31","16_21","19_21","20_20","20_21"}, <21> {"0_31","16_21","19_21","20_21","21_21"}, <22> {"0_31","22_22"}, <23> {"0_31","23_23","23_25","23_30"}, <24> {"0_31","23_25","23_30","24_24"}, <25> {"0_31","23_25","23_30","25_25"}, <26> {"0_31","23_30","26_26"}, <27> {"0_31","23_30","27_27"}, <28> {"0_31","23_30","28_28"}, <29> {"0_31","23_30","29_29"}, <30> {"0_31","23_30","30_30"}, <31> {"0_31","31_31"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Activity_ongoing"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Compliance"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Commitment"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Cause_to_end"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Collaboration"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Relative_time"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Position_on_a_scale"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Statement"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Adducing"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Organization"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Source_of_getting"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Reveal_secret"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Relational_quantity"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Process_continue"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Origin"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Collaboration"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
subto overlap19: forall <i> in I do 
 sum <r> in Roles["Intentionally_act"] do 
 sum <s> in G[i] do z19[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Activity_ongoing"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Compliance"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Commitment"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Cause_to_end"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Quantity"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Weapon"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Collaboration"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Relative_time"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Position_on_a_scale"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Statement"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Adducing"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Organization"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Source_of_getting"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Reveal_secret"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Relational_quantity"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Process_continue"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Origin"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Weapon"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Collaboration"] do sum <s> in Spans : z18[r,s] == 1;
subto unique19: forall <r> in Roles["Intentionally_act"] do sum <s> in Spans : z19[r,s] == 1;
#pairwise exclusion constraint
set Exc3 := {<"Agent","Cause">,<"Process","State">};
subto exclusion3: forall <ri,rj> in Exc3 do z3[ri,"-1_-1"] + z3[rj,"-1_-1"] >= 1;
set Exc4 := {<"Individuals","Mass">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc6 := {<"Partner_2","Partners">,<"Partner_1","Partners">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc18 := {<"Partner_2","Partners">,<"Partner_1","Partners">};
subto exclusion18: forall <ri,rj> in Exc18 do z18[ri,"-1_-1"] + z18[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr6 := {<"Partner_1","Partner_2">};
subto require6: forall <ri,rj> in Reqr6 do z6[ri,"-1_-1"] - z6[rj,"-1_-1"] == 0;
set Reqr18 := {<"Partner_1","Partner_2">};
subto require18: forall <ri,rj> in Reqr18 do z18[ri,"-1_-1"] - z18[rj,"-1_-1"] == 0;
