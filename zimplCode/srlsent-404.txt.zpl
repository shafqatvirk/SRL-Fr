# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence
set Frames := {"Desirable_event","Aggregate","Participation"};
set Roles[Frames] :=  <"Desirable_event"> {"State_of_affairs","Purpose"}, <"Aggregate"> {"Individuals","AggregateProperty","Aggregate","Name","Domain","Container_possessor"}, <"Participation"> {"Purpose","Time","Place","Institution","Participants","Event","Means","Participant_2","Participant_1","Duration","Degree_of_involvement","Manner"};
set Spans := {"-1_-1","0_0","0_10","10_10","1_1","2_2","2_3","3_3","4_4","5_5","6_6","6_9","7_7","7_8","8_8","9_9"};
set Assignment[<f> in Frames] := {Roles[f]*Spans};
var z0[Assignment["Desirable_event"]] binary;
var z1[Assignment["Aggregate"]] binary;
var z2[Assignment["Participation"]] binary;
param probabilities0[Assignment["Desirable_event"]] := read "../frameData/frame0.txt" as "<1s,2s> 3n" skip 2;
param probabilities1[Assignment["Aggregate"]] := read "../frameData/frame1.txt" as "<1s,2s> 3n" skip 2;
param probabilities2[Assignment["Participation"]] := read "../frameData/frame2.txt" as "<1s,2s> 3n" skip 2;

 #Objective Function 
maximize assign : (sum <r,s> in Assignment["Desirable_event"] : probabilities0[r,s] * z0[r,s])+(sum <r,s> in Assignment["Aggregate"] : probabilities1[r,s] * z1[r,s])+(sum <r,s> in Assignment["Participation"] : probabilities2[r,s] * z2[r,s]);
#Constraints
#Overlap Constraints
set I := {0 to 10};
set G[I] := <0> {"0_0","0_10"}, <1> {"0_10","1_1"}, <2> {"0_10","2_2","2_3"}, <3> {"0_10","2_3","3_3"}, <4> {"0_10","4_4"}, <5> {"0_10","5_5"}, <6> {"0_10","6_6","6_9"}, <7> {"0_10","6_9","7_7","7_8"}, <8> {"0_10","6_9","7_8","8_8"}, <9> {"0_10","6_9","9_9"}, <10> {"0_10","10_10"};
subto overlap0: forall <i> in I do 
 sum <r> in Roles["Desirable_event"] do 
 sum <s> in G[i] do z0[r,s] <= 1;
subto overlap1: forall <i> in I do 
 sum <r> in Roles["Aggregate"] do 
 sum <s> in G[i] do z1[r,s] <= 1;
subto overlap2: forall <i> in I do 
 sum <r> in Roles["Participation"] do 
 sum <s> in G[i] do z2[r,s] <= 1;
#Uniqueness Constraint
subto unique0: forall <r> in Roles["Desirable_event"] do sum <s> in Spans : z0[r,s] == 1;
subto unique1: forall <r> in Roles["Aggregate"] do sum <s> in Spans : z1[r,s] == 1;
subto unique2: forall <r> in Roles["Participation"] do sum <s> in Spans : z2[r,s] == 1;
#pairwise exclusion constraint
set Exc2 := {<"Event","Institution">,<"Participant_2","Participants">,<"Participant_1","Participants">};
subto exclusion2: forall <ri,rj> in Exc2 do z2[ri,"-1_-1"] + z2[rj,"-1_-1"] >= 1;
#pairwise requirement constraint
