# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Existence","Sign","Concessive","Idiosyncrasy","Employing","Participation","Project","Inclusion","Likelihood","Supply","Awareness","Gizmo","Ingredients","Leadership","Foreign_or_domestic_country","Information","Employing","Morality_evaluation","Color","Risky_situation","Weapon","Idiosyncrasy","People_by_vocation","Capability","Trust","Ingredients","Secrecy_status","Political_locales","Network","Correctness","Building_subparts"};
set Roles[Frames] :=  <"Existence"> {"Place","Duration","Inherent_purpose","Entity","Point_of_view","Time","Circumstances","State","Cause"}, <"Sign"> {"Degree","Indicator","Indicated"}, <"Concessive"> {"Main_statement","Statement"}, <"Idiosyncrasy"> {"Degree","Entity","Idiosyncrasy"}, <"Employing"> {"Purpose","Time","Descriptor","Place","Field","Task","Employer","Compensation","Position","Manner","Contract_basis","Employee"}, <"Participation"> {"Purpose","Time","Place","Institution","Participants","Event","Means","Participant_2","Participant_1","Duration","Degree_of_involvement","Manner"}, <"Project"> {"Salient_entity","Duration","Agent","Goal","Manner","Name","Project","Field","Descriptor","Activity"}, <"Inclusion"> {"Purpose","Total","Contrast_set","Subregion","Frequency","Part"}, <"Likelihood"> {"Time","Place","Circumstances","Reason","Hypothetical_event","Degree"}, <"Supply"> {"Recipient","Circumstances","Time","Supplier","Place","Co_theme","Purpose","Period_of_iterations","Means","Source","Theme","Purpose_of_recipient","Manner"}, <"Awareness"> {"Cognizer","Topic","Degree","Role","Manner","Evidence","Explanation","Time","Content","Expressor","Paradigm"}, <"Gizmo"> {"Descriptor","Power_source","Gizmo","Use","User"}, <"Ingredients"> {"Source","Type","Use","Material","Product","Descriptor"}, <"Leadership"> {"Domain","Leader","Type","Depictive","Descriptor","Degree","Means","Role","Activity","Duration","Governed","Manner","Time"}, <"Foreign_or_domestic_country"> {"Relative_location","Name","Descriptor","Current_country","Population","Discourse_salient_country"}, <"Information"> {"Means_of_Gathering","Source","Topic","Information","Cognizer"}, <"Employing"> {"Purpose","Time","Descriptor","Place","Field","Task","Employer","Compensation","Position","Manner","Contract_basis","Employee"}, <"Morality_evaluation"> {"Evaluee","Degree","Behavior","Expressor"}, <"Color"> {"Type","Attribute","Color","Sub-region","Degree","Comparand","Entity","Descriptor","Cause","Color_qualifier"}, <"Risky_situation"> {"Dangerous_entity","Asset","Degree","Domain","Situation","Time","Circumstances","Frequency"}, <"Weapon"> {"Type","Use","Wielder","Descriptor","Material","Name","Part","Weapon","Time_of_creation","Creator"}, <"Idiosyncrasy"> {"Degree","Entity","Idiosyncrasy"}, <"People_by_vocation"> {"Type","Origin","Contract_basis","Ethnicity","Employer","Place_of_employment","Person","Descriptor","Rank","Compensation","Persistent_characteristic"}, <"Capability"> {"Degree","Status","Entity","Relevant_feature","Circumstances","Role","Event","Cause"}, <"Trust"> {"Manner","Degree","Source","Information","Cognizer"}, <"Ingredients"> {"Source","Type","Use","Material","Product","Descriptor"}, <"Secrecy_status"> {"Time","Phenomenon","Degree","Epistemic_stance","Cognizer"}, <"Political_locales"> {"Relative_location","Constituent_parts","Container_possessor","Descriptor","Name","Population","Locale"}, <"Network"> {"Possessor","Descriptor","Connections","Network","Nodes"}, <"Correctness"> {"Domain","Result","Circumstances","Parameter","Time","Frequency","Degree","Communicative_act","Source","Information","Topic","Epistemic_stance","Manner","Medium"}, <"Building_subparts"> {"Whole","Type","Building_part","Use"};
set Spans := {"-1_-1","0_0","0_1","0_2","0_76","10_10","10_15","11_11","12_12","12_15","13_13","13_15","14_14","14_15","15_15","16_16","17_17","17_18","18_18","19_19","1_1","1_2","20_20","20_37","21_21","21_37","22_22","22_37","23_23","23_24","23_29","24_24","25_25","26_26","27_27","28_28","29_29","2_2","30_30","30_37","31_31","32_32","32_37","33_33","33_37","34_34","35_35","35_36","35_37","36_36","37_37","38_38","39_39","39_51","3_3","40_40","40_42","41_41","42_42","43_43","44_44","44_51","45_45","45_47","45_51","46_46","47_47","48_48","48_51","49_49","49_51","4_4","50_50","50_51","51_51","52_52","53_53","54_54","54_56","55_55","56_56","57_57","58_58","58_59","59_59","5_5","60_60","61_61","61_75","62_62","62_75","63_63","64_64","64_75","65_65","65_75","66_66","66_75","67_67","67_70","67_75","68_68","69_69","6_37","6_6","70_70","71_71","71_75","72_72","72_75","73_73","74_74","75_75","76_76","7_19","7_20","7_37","7_7","8_8","9_15","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Existence"]] binary;
var z1[Assignment["Sign"]] binary;
var z2[Assignment["Concessive"]] binary;
var z3[Assignment["Idiosyncrasy"]] binary;
var z4[Assignment["Employing"]] binary;
var z5[Assignment["Participation"]] binary;
var z6[Assignment["Project"]] binary;
var z7[Assignment["Inclusion"]] binary;
var z8[Assignment["Likelihood"]] binary;
var z9[Assignment["Supply"]] binary;
var z10[Assignment["Awareness"]] binary;
var z11[Assignment["Gizmo"]] binary;
var z12[Assignment["Ingredients"]] binary;
var z13[Assignment["Leadership"]] binary;
var z14[Assignment["Foreign_or_domestic_country"]] binary;
var z15[Assignment["Information"]] binary;
var z16[Assignment["Employing"]] binary;
var z17[Assignment["Morality_evaluation"]] binary;
var z18[Assignment["Color"]] binary;
var z19[Assignment["Risky_situation"]] binary;
var z20[Assignment["Weapon"]] binary;
var z21[Assignment["Idiosyncrasy"]] binary;
var z22[Assignment["People_by_vocation"]] binary;
var z23[Assignment["Capability"]] binary;
var z24[Assignment["Trust"]] binary;
var z25[Assignment["Ingredients"]] binary;
var z26[Assignment["Secrecy_status"]] binary;
var z27[Assignment["Political_locales"]] binary;
var z28[Assignment["Network"]] binary;
var z29[Assignment["Correctness"]] binary;
var z30[Assignment["Building_subparts"]] binary;
param probabilities0[Assignment["Existence"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Sign"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Concessive"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;
param probabilities3[Assignment["Idiosyncrasy"]] := read "../frameData/frame3.txt" as "<1s,2s> 3n" skip 2;
param probabilities4[Assignment["Employing"]] := read "../frameData/frame4.txt" as "<1s,2s> 3n" skip 2;
param probabilities5[Assignment["Participation"]] := read "../frameData/frame5.txt" as "<1s,2s> 3n" skip 2;
param probabilities6[Assignment["Project"]] := read "../frameData/frame6.txt" as "<1s,2s> 3n" skip 2;
param probabilities7[Assignment["Inclusion"]] := read "../frameData/frame7.txt" as "<1s,2s> 3n" skip 2;
param probabilities8[Assignment["Likelihood"]] := read "../frameData/frame8.txt" as "<1s,2s> 3n" skip 2;
param probabilities9[Assignment["Supply"]] := read "../frameData/frame9.txt" as "<1s,2s> 3n" skip 2;
param probabilities10[Assignment["Awareness"]] := read "../frameData/frame10.txt" as "<1s,2s> 3n" skip 2;
param probabilities11[Assignment["Gizmo"]] := read "../frameData/frame11.txt" as "<1s,2s> 3n" skip 2;
param probabilities12[Assignment["Ingredients"]] := read "../frameData/frame12.txt" as "<1s,2s> 3n" skip 2;
param probabilities13[Assignment["Leadership"]] := read "../frameData/frame13.txt" as "<1s,2s> 3n" skip 2;
param probabilities14[Assignment["Foreign_or_domestic_country"]] := read "../frameData/frame14.txt" as "<1s,2s> 3n" skip 2;
param probabilities15[Assignment["Information"]] := read "../frameData/frame15.txt" as "<1s,2s> 3n" skip 2;
param probabilities16[Assignment["Employing"]] := read "../frameData/frame16.txt" as "<1s,2s> 3n" skip 2;
param probabilities17[Assignment["Morality_evaluation"]] := read "../frameData/frame17.txt" as "<1s,2s> 3n" skip 2;
param probabilities18[Assignment["Color"]] := read "../frameData/frame18.txt" as "<1s,2s> 3n" skip 2;
param probabilities19[Assignment["Risky_situation"]] := read "../frameData/frame19.txt" as "<1s,2s> 3n" skip 2;
param probabilities20[Assignment["Weapon"]] := read "../frameData/frame20.txt" as "<1s,2s> 3n" skip 2;
param probabilities21[Assignment["Idiosyncrasy"]] := read "../frameData/frame21.txt" as "<1s,2s> 3n" skip 2;
param probabilities22[Assignment["People_by_vocation"]] := read "../frameData/frame22.txt" as "<1s,2s> 3n" skip 2;
param probabilities23[Assignment["Capability"]] := read "../frameData/frame23.txt" as "<1s,2s> 3n" skip 2;
param probabilities24[Assignment["Trust"]] := read "../frameData/frame24.txt" as "<1s,2s> 3n" skip 2;
param probabilities25[Assignment["Ingredients"]] := read "../frameData/frame25.txt" as "<1s,2s> 3n" skip 2;
param probabilities26[Assignment["Secrecy_status"]] := read "../frameData/frame26.txt" as "<1s,2s> 3n" skip 2;
param probabilities27[Assignment["Political_locales"]] := read "../frameData/frame27.txt" as "<1s,2s> 3n" skip 2;
param probabilities28[Assignment["Network"]] := read "../frameData/frame28.txt" as "<1s,2s> 3n" skip 2;
param probabilities29[Assignment["Correctness"]] := read "../frameData/frame29.txt" as "<1s,2s> 3n" skip 2;
param probabilities30[Assignment["Building_subparts"]] := read "../frameData/frame30.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Existence"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Sign"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Concessive"] : probabilities2[r,s] * z2[r,s])+(sum <r,s> in Assignment["Idiosyncrasy"] : probabilities3[r,s] * z3[r,s])+(sum <r,s> in Assignment["Employing"] : probabilities4[r,s] * z4[r,s])+(sum <r,s> in Assignment["Participation"] : probabilities5[r,s] * z5[r,s])+(sum <r,s> in Assignment["Project"] : probabilities6[r,s] * z6[r,s])+(sum <r,s> in Assignment["Inclusion"] : probabilities7[r,s] * z7[r,s])+(sum <r,s> in Assignment["Likelihood"] : probabilities8[r,s] * z8[r,s])+(sum <r,s> in Assignment["Supply"] : probabilities9[r,s] * z9[r,s])+(sum <r,s> in Assignment["Awareness"] : probabilities10[r,s] * z10[r,s])+(sum <r,s> in Assignment["Gizmo"] : probabilities11[r,s] * z11[r,s])+(sum <r,s> in Assignment["Ingredients"] : probabilities12[r,s] * z12[r,s])+(sum <r,s> in Assignment["Leadership"] : probabilities13[r,s] * z13[r,s])+(sum <r,s> in Assignment["Foreign_or_domestic_country"] : probabilities14[r,s] * z14[r,s])+(sum <r,s> in Assignment["Information"] : probabilities15[r,s] * z15[r,s])+(sum <r,s> in Assignment["Employing"] : probabilities16[r,s] * z16[r,s])+(sum <r,s> in Assignment["Morality_evaluation"] : probabilities17[r,s] * z17[r,s])+(sum <r,s> in Assignment["Color"] : probabilities18[r,s] * z18[r,s])+(sum <r,s> in Assignment["Risky_situation"] : probabilities19[r,s] * z19[r,s])+(sum <r,s> in Assignment["Weapon"] : probabilities20[r,s] * z20[r,s])+(sum <r,s> in Assignment["Idiosyncrasy"] : probabilities21[r,s] * z21[r,s])+(sum <r,s> in Assignment["People_by_vocation"] : probabilities22[r,s] * z22[r,s])+(sum <r,s> in Assignment["Capability"] : probabilities23[r,s] * z23[r,s])+(sum <r,s> in Assignment["Trust"] : probabilities24[r,s] * z24[r,s])+(sum <r,s> in Assignment["Ingredients"] : probabilities25[r,s] * z25[r,s])+(sum <r,s> in Assignment["Secrecy_status"] : probabilities26[r,s] * z26[r,s])+(sum <r,s> in Assignment["Political_locales"] : probabilities27[r,s] * z27[r,s])+(sum <r,s> in Assignment["Network"] : probabilities28[r,s] * z28[r,s])+(sum <r,s> in Assignment["Correctness"] : probabilities29[r,s] * z29[r,s])+(sum <r,s> in Assignment["Building_subparts"] : probabilities30[r,s] * z30[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 76};
set G[I] := <0> {"0_0","0_1","0_2","0_76"}, <1> {"0_1","0_2","0_76","1_1","1_2"}, <2> {"0_2","0_76","1_2","2_2"}, <3> {"0_76","3_3"}, <4> {"0_76","4_4"}, <5> {"0_76","5_5"}, <6> {"0_76","6_37","6_6"}, <7> {"0_76","6_37","7_19","7_20","7_37","7_7"}, <8> {"0_76","6_37","7_19","7_20","7_37","8_8"}, <9> {"0_76","6_37","7_19","7_20","7_37","9_15","9_9"}, <10> {"0_76","10_10","10_15","6_37","7_19","7_20","7_37","9_15"}, <11> {"0_76","10_15","11_11","6_37","7_19","7_20","7_37","9_15"}, <12> {"0_76","10_15","12_12","12_15","6_37","7_19","7_20","7_37","9_15"}, <13> {"0_76","10_15","12_15","13_13","13_15","6_37","7_19","7_20","7_37","9_15"}, <14> {"0_76","10_15","12_15","13_15","14_14","14_15","6_37","7_19","7_20","7_37","9_15"}, <15> {"0_76","10_15","12_15","13_15","14_15","15_15","6_37","7_19","7_20","7_37","9_15"}, <16> {"0_76","16_16","6_37","7_19","7_20","7_37"}, <17> {"0_76","17_17","17_18","6_37","7_19","7_20","7_37"}, <18> {"0_76","17_18","18_18","6_37","7_19","7_20","7_37"}, <19> {"0_76","19_19","6_37","7_19","7_20","7_37"}, <20> {"0_76","20_20","20_37","6_37","7_20","7_37"}, <21> {"0_76","20_37","21_21","21_37","6_37","7_37"}, <22> {"0_76","20_37","21_37","22_22","22_37","6_37","7_37"}, <23> {"0_76","20_37","21_37","22_37","23_23","23_24","23_29","6_37","7_37"}, <24> {"0_76","20_37","21_37","22_37","23_24","23_29","24_24","6_37","7_37"}, <25> {"0_76","20_37","21_37","22_37","23_29","25_25","6_37","7_37"}, <26> {"0_76","20_37","21_37","22_37","23_29","26_26","6_37","7_37"}, <27> {"0_76","20_37","21_37","22_37","23_29","27_27","6_37","7_37"}, <28> {"0_76","20_37","21_37","22_37","23_29","28_28","6_37","7_37"}, <29> {"0_76","20_37","21_37","22_37","23_29","29_29","6_37","7_37"}, <30> {"0_76","20_37","21_37","22_37","30_30","30_37","6_37","7_37"}, <31> {"0_76","20_37","21_37","22_37","30_37","31_31","6_37","7_37"}, <32> {"0_76","20_37","21_37","22_37","30_37","32_32","32_37","6_37","7_37"}, <33> {"0_76","20_37","21_37","22_37","30_37","32_37","33_33","33_37","6_37","7_37"}, <34> {"0_76","20_37","21_37","22_37","30_37","32_37","33_37","34_34","6_37","7_37"}, <35> {"0_76","20_37","21_37","22_37","30_37","32_37","33_37","35_35","35_36","35_37","6_37","7_37"}, <36> {"0_76","20_37","21_37","22_37","30_37","32_37","33_37","35_36","35_37","36_36","6_37","7_37"}, <37> {"0_76","20_37","21_37","22_37","30_37","32_37","33_37","35_37","37_37","6_37","7_37"}, <38> {"0_76","38_38"}, <39> {"0_76","39_39","39_51"}, <40> {"0_76","39_51","40_40","40_42"}, <41> {"0_76","39_51","40_42","41_41"}, <42> {"0_76","39_51","40_42","42_42"}, <43> {"0_76","39_51","43_43"}, <44> {"0_76","39_51","44_44","44_51"}, <45> {"0_76","39_51","44_51","45_45","45_47","45_51"}, <46> {"0_76","39_51","44_51","45_47","45_51","46_46"}, <47> {"0_76","39_51","44_51","45_47","45_51","47_47"}, <48> {"0_76","39_51","44_51","45_51","48_48","48_51"}, <49> {"0_76","39_51","44_51","45_51","48_51","49_49","49_51"}, <50> {"0_76","39_51","44_51","45_51","48_51","49_51","50_50","50_51"}, <51> {"0_76","39_51","44_51","45_51","48_51","49_51","50_51","51_51"}, <52> {"0_76","52_52"}, <53> {"0_76","53_53"}, <54> {"0_76","54_54","54_56"}, <55> {"0_76","54_56","55_55"}, <56> {"0_76","54_56","56_56"}, <57> {"0_76","57_57"}, <58> {"0_76","58_58","58_59"}, <59> {"0_76","58_59","59_59"}, <60> {"0_76","60_60"}, <61> {"0_76","61_61","61_75"}, <62> {"0_76","61_75","62_62","62_75"}, <63> {"0_76","61_75","62_75","63_63"}, <64> {"0_76","61_75","62_75","64_64","64_75"}, <65> {"0_76","61_75","62_75","64_75","65_65","65_75"}, <66> {"0_76","61_75","62_75","64_75","65_75","66_66","66_75"}, <67> {"0_76","61_75","62_75","64_75","65_75","66_75","67_67","67_70","67_75"}, <68> {"0_76","61_75","62_75","64_75","65_75","66_75","67_70","67_75","68_68"}, <69> {"0_76","61_75","62_75","64_75","65_75","66_75","67_70","67_75","69_69"}, <70> {"0_76","61_75","62_75","64_75","65_75","66_75","67_70","67_75","70_70"}, <71> {"0_76","61_75","62_75","64_75","65_75","66_75","67_75","71_71","71_75"}, <72> {"0_76","61_75","62_75","64_75","65_75","66_75","67_75","71_75","72_72","72_75"}, <73> {"0_76","61_75","62_75","64_75","65_75","66_75","67_75","71_75","72_75","73_73"}, <74> {"0_76","61_75","62_75","64_75","65_75","66_75","67_75","71_75","72_75","74_74"}, <75> {"0_76","61_75","62_75","64_75","65_75","66_75","67_75","71_75","72_75","75_75"}, <76> {"0_76","76_76"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Existence"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Sign"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Concessive"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
subto overlap3: forall <i> in I do 
 sum <r> in Roles["Idiosyncrasy"] do 
 sum <s> in G[i] do z3[r,s] <= 1;
subto overlap4: forall <i> in I do 
 sum <r> in Roles["Employing"] do 
 sum <s> in G[i] do z4[r,s] <= 1;
subto overlap5: forall <i> in I do 
 sum <r> in Roles["Participation"] do 
 sum <s> in G[i] do z5[r,s] <= 1;
subto overlap6: forall <i> in I do 
 sum <r> in Roles["Project"] do 
 sum <s> in G[i] do z6[r,s] <= 1;
subto overlap7: forall <i> in I do 
 sum <r> in Roles["Inclusion"] do 
 sum <s> in G[i] do z7[r,s] <= 1;
subto overlap8: forall <i> in I do 
 sum <r> in Roles["Likelihood"] do 
 sum <s> in G[i] do z8[r,s] <= 1;
subto overlap9: forall <i> in I do 
 sum <r> in Roles["Supply"] do 
 sum <s> in G[i] do z9[r,s] <= 1;
subto overlap10: forall <i> in I do 
 sum <r> in Roles["Awareness"] do 
 sum <s> in G[i] do z10[r,s] <= 1;
subto overlap11: forall <i> in I do 
 sum <r> in Roles["Gizmo"] do 
 sum <s> in G[i] do z11[r,s] <= 1;
subto overlap12: forall <i> in I do 
 sum <r> in Roles["Ingredients"] do 
 sum <s> in G[i] do z12[r,s] <= 1;
subto overlap13: forall <i> in I do 
 sum <r> in Roles["Leadership"] do 
 sum <s> in G[i] do z13[r,s] <= 1;
subto overlap14: forall <i> in I do 
 sum <r> in Roles["Foreign_or_domestic_country"] do 
 sum <s> in G[i] do z14[r,s] <= 1;
subto overlap15: forall <i> in I do 
 sum <r> in Roles["Information"] do 
 sum <s> in G[i] do z15[r,s] <= 1;
subto overlap16: forall <i> in I do 
 sum <r> in Roles["Employing"] do 
 sum <s> in G[i] do z16[r,s] <= 1;
subto overlap17: forall <i> in I do 
 sum <r> in Roles["Morality_evaluation"] do 
 sum <s> in G[i] do z17[r,s] <= 1;
subto overlap18: forall <i> in I do 
 sum <r> in Roles["Color"] do 
 sum <s> in G[i] do z18[r,s] <= 1;
subto overlap19: forall <i> in I do 
 sum <r> in Roles["Risky_situation"] do 
 sum <s> in G[i] do z19[r,s] <= 1;
subto overlap20: forall <i> in I do 
 sum <r> in Roles["Weapon"] do 
 sum <s> in G[i] do z20[r,s] <= 1;
subto overlap21: forall <i> in I do 
 sum <r> in Roles["Idiosyncrasy"] do 
 sum <s> in G[i] do z21[r,s] <= 1;
subto overlap22: forall <i> in I do 
 sum <r> in Roles["People_by_vocation"] do 
 sum <s> in G[i] do z22[r,s] <= 1;
subto overlap23: forall <i> in I do 
 sum <r> in Roles["Capability"] do 
 sum <s> in G[i] do z23[r,s] <= 1;
subto overlap24: forall <i> in I do 
 sum <r> in Roles["Trust"] do 
 sum <s> in G[i] do z24[r,s] <= 1;
subto overlap25: forall <i> in I do 
 sum <r> in Roles["Ingredients"] do 
 sum <s> in G[i] do z25[r,s] <= 1;
subto overlap26: forall <i> in I do 
 sum <r> in Roles["Secrecy_status"] do 
 sum <s> in G[i] do z26[r,s] <= 1;
subto overlap27: forall <i> in I do 
 sum <r> in Roles["Political_locales"] do 
 sum <s> in G[i] do z27[r,s] <= 1;
subto overlap28: forall <i> in I do 
 sum <r> in Roles["Network"] do 
 sum <s> in G[i] do z28[r,s] <= 1;
subto overlap29: forall <i> in I do 
 sum <r> in Roles["Correctness"] do 
 sum <s> in G[i] do z29[r,s] <= 1;
subto overlap30: forall <i> in I do 
 sum <r> in Roles["Building_subparts"] do 
 sum <s> in G[i] do z30[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Existence"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Sign"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Concessive"] do sum <s> in Spans : z2[r,s] == 1;
subto unique3: forall <r> in Roles["Idiosyncrasy"] do sum <s> in Spans : z3[r,s] == 1;
subto unique4: forall <r> in Roles["Employing"] do sum <s> in Spans : z4[r,s] == 1;
subto unique5: forall <r> in Roles["Participation"] do sum <s> in Spans : z5[r,s] == 1;
subto unique6: forall <r> in Roles["Project"] do sum <s> in Spans : z6[r,s] == 1;
subto unique7: forall <r> in Roles["Inclusion"] do sum <s> in Spans : z7[r,s] == 1;
subto unique8: forall <r> in Roles["Likelihood"] do sum <s> in Spans : z8[r,s] == 1;
subto unique9: forall <r> in Roles["Supply"] do sum <s> in Spans : z9[r,s] == 1;
subto unique10: forall <r> in Roles["Awareness"] do sum <s> in Spans : z10[r,s] == 1;
subto unique11: forall <r> in Roles["Gizmo"] do sum <s> in Spans : z11[r,s] == 1;
subto unique12: forall <r> in Roles["Ingredients"] do sum <s> in Spans : z12[r,s] == 1;
subto unique13: forall <r> in Roles["Leadership"] do sum <s> in Spans : z13[r,s] == 1;
subto unique14: forall <r> in Roles["Foreign_or_domestic_country"] do sum <s> in Spans : z14[r,s] == 1;
subto unique15: forall <r> in Roles["Information"] do sum <s> in Spans : z15[r,s] == 1;
subto unique16: forall <r> in Roles["Employing"] do sum <s> in Spans : z16[r,s] == 1;
subto unique17: forall <r> in Roles["Morality_evaluation"] do sum <s> in Spans : z17[r,s] == 1;
subto unique18: forall <r> in Roles["Color"] do sum <s> in Spans : z18[r,s] == 1;
subto unique19: forall <r> in Roles["Risky_situation"] do sum <s> in Spans : z19[r,s] == 1;
subto unique20: forall <r> in Roles["Weapon"] do sum <s> in Spans : z20[r,s] == 1;
subto unique21: forall <r> in Roles["Idiosyncrasy"] do sum <s> in Spans : z21[r,s] == 1;
subto unique22: forall <r> in Roles["People_by_vocation"] do sum <s> in Spans : z22[r,s] == 1;
subto unique23: forall <r> in Roles["Capability"] do sum <s> in Spans : z23[r,s] == 1;
subto unique24: forall <r> in Roles["Trust"] do sum <s> in Spans : z24[r,s] == 1;
subto unique25: forall <r> in Roles["Ingredients"] do sum <s> in Spans : z25[r,s] == 1;
subto unique26: forall <r> in Roles["Secrecy_status"] do sum <s> in Spans : z26[r,s] == 1;
subto unique27: forall <r> in Roles["Political_locales"] do sum <s> in Spans : z27[r,s] == 1;
subto unique28: forall <r> in Roles["Network"] do sum <s> in Spans : z28[r,s] == 1;
subto unique29: forall <r> in Roles["Correctness"] do sum <s> in Spans : z29[r,s] == 1;
subto unique30: forall <r> in Roles["Building_subparts"] do sum <s> in Spans : z30[r,s] == 1;
#pairwise exclusion constraint
set Exc5 := {<"Event","Institution">,<"Participant_2","Participants">,<"Participant_1","Participants">};
subto exclusion5: forall <ri,rj> in Exc5 do z5[ri,"-1_-1"] + z5[rj,"-1_-1"] >= 1;
set Exc6 := {<"Activity","Salient_entity">};
subto exclusion6: forall <ri,rj> in Exc6 do z6[ri,"-1_-1"] + z6[rj,"-1_-1"] >= 1;
set Exc10 := {<"Cognizer","Expressor">};
subto exclusion10: forall <ri,rj> in Exc10 do z10[ri,"-1_-1"] + z10[rj,"-1_-1"] >= 1;
set Exc19 := {<"Dangerous_entity","Situation">};
subto exclusion19: forall <ri,rj> in Exc19 do z19[ri,"-1_-1"] + z19[rj,"-1_-1"] >= 1;
set Exc29 := {<"Source","Topic">};
subto exclusion29: forall <ri,rj> in Exc29 do z29[ri,"-1_-1"] + z29[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
