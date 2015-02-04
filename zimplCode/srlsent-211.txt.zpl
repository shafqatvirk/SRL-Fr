# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Theft","Foreign_or_domestic_country","Manufacturing","Perception_active","Emotion_directed","Employing","Expensiveness","Businesses","Quantity","Political_locales","Competition"};
set Roles[Frames] :=  <"Theft"> {"Purpose","Time","Goods","Instrument","Place","Frequency","Means","Source","Reason","Perpetrator","Victim","Manner"}, <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Manufacturing"> {"Purpose","Circumstances","Time","Manufacturer","Instrument","Place","Frequency","Resource","Means","Locus","Consumer","Depictive","Factory","Product","Manner"}, <"Perception_active"> {"Purpose","Depictive","Place","Location_of_perceiver","Expected_entity","Body_part","Direction","State","Means","Phenomenon","Duration","Manner","Perceiver_agentive","Time"}, <"Emotion_directed"> {"Topic","Circumstances","Parameter","Degree","Experiencer","Event","Expressor","Reason","Empathy_target","Manner","State","Stimulus","Frequency"}, <"Employing"> {"Purpose","Time","Descriptor","Place","Field","Task","Employer","Compensation","Position","Manner","Contract_basis","Employee"}, <"Expensiveness"> {"Asset","Goods","Rate","Origin","Intended_event","Degree","Payer"}, <"Businesses"> {"Descriptor","Business_Name","Service_provider","Business","Place","Product","Proprietor"}, <"Quantity"> {"Mass","Q_Prop","Degree","Quantity","Individuals"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Competition"> {"Purpose","Rank","Time","Prize","Place","Frequency","Degree","Participants","Venue","Participant_1","Competition","Duration","Manner","Participant_2"};
set Spans := {"-1_-1","0_0","0_1","0_21","0_9","10_10","10_21","11_11","11_20","12_12","12_13","13_13","14_14","15_15","16_16","16_20","17_17","17_20","18_18","19_19","1_1","20_20","21_21","2_2","2_9","3_3","3_5","3_6","3_9","4_4","5_5","6_6","7_7","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Theft"]] binary;
var z1[Assignment["Foreign_or_domestic_country"]] binary;
var z2[Assignment["Manufacturing"]] binary;
var z3[Assignment["Perception_active"]] binary;
var z4[Assignment["Emotion_directed"]] binary;
var z5[Assignment["Employing"]] binary;
var z6[Assignment["Expensiveness"]] binary;
var z7[Assignment["Businesses"]] binary;
var z8[Assignment["Quantity"]] binary;
var z9[Assignment["Political_locales"]] binary;
var z10[Assignment["Competition"]] binary;
param probabilities0[Assignment["Theft"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Manufacturing"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Perception_active"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Emotion_directed"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Employing"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Expensiveness"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Businesses"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Quantity"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Political_locales"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Competition"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Theft"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Manufacturing"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Perception_active"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Emotion_directed"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Employing"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Expensiveness"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Businesses"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Quantity"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Competition"] : probabilities10[r,s] * z10[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 21};
set G[I] := <0> {"0_0","0_1","0_21","0_9"}, <1> {"0_1","0_21","0_9","1_1"}, <2> {"0_21","0_9","2_2","2_9"}, <3> {"0_21","0_9","2_9","3_3","3_5","3_6","3_9"}, <4> {"0_21","0_9","2_9","3_5","3_6","3_9","4_4"}, <5> {"0_21","0_9","2_9","3_5","3_6","3_9","5_5"}, <6> {"0_21","0_9","2_9","3_6","3_9","6_6"}, <7> {"0_21","0_9","2_9","3_9","7_7"}, <8> {"0_21","0_9","2_9","3_9","8_8"}, <9> {"0_21","0_9","2_9","3_9","9_9"}, <10> {"0_21","10_10","10_21"}, <11> {"0_21","10_21","11_11","11_20"}, <12> {"0_21","10_21","11_20","12_12","12_13"}, <13> {"0_21","10_21","11_20","12_13","13_13"}, <14> {"0_21","10_21","11_20","14_14"}, <15> {"0_21","10_21","11_20","15_15"}, <16> {"0_21","10_21","11_20","16_16","16_20"}, <17> {"0_21","10_21","11_20","16_20","17_17","17_20"}, <18> {"0_21","10_21","11_20","16_20","17_20","18_18"}, <19> {"0_21","10_21","11_20","16_20","17_20","19_19"}, <20> {"0_21","10_21","11_20","16_20","17_20","20_20"}, <21> {"0_21","10_21","21_21"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Theft"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Manufacturing"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Perception_active"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Emotion_directed"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Employing"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Expensiveness"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Businesses"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Quantity"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Competition"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Theft"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Manufacturing"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Perception_active"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Emotion_directed"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Employing"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Expensiveness"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Businesses"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Quantity"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Competition"] do sum <s> in Spans : z10[r,s] == 1;
#pairwise exclusion constraint
set Exc4 := {<"Event","Experiencer">,<"Experiencer","Expressor">,<"Event","Expressor">};
subto exclusion4: forall <ri,rj> in Exc4 do z4[ri,"-1_-1"] + z4[rj,"-1_-1"] >= 1;
set Exc6 := {<"Goods","Intended_event">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc8 := {<"Individuals","Mass">};
subto exclusion8: forall <ri,rj> in Exc8 do z8[ri,"-1_-1"] + z8[rj,"-1_-1"] >= 1;
set Exc10 := {<"Participant_2","Participants">,<"Participant_1","Participants">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
set Reqr10 := {<"Participant_1","Participant_2">};
subto require10: forall <ri,rj> in Reqr10 do z10[ri,"-1_-1"] - z10[rj,"-1_-1"] == 0;
