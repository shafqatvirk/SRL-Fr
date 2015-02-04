import os
from frameRelationFuns import *
def generate_zimple_program(sent):
	exclusionDict = buildExclusionDict()
	requireDict = buildRequirDict()
	sent_file_name = str(sent).split('/')[-1]
	inputFile = open(sent)
	frames = []
	roles = {}
	spans = {}
	frameLines = []
	while True:
		l = inputFile.readline()
		if not l: break
		if l.split(' ')[0] == 'Frame:':
			f = l.split(' ')[1].rstrip()
			frames.append(f)
			r = inputFile.readline()
			roles[f] = r.rstrip().split(' ')
			s = inputFile.readline()
			spans[f] = s.rstrip().split(' ')
	frame_file = open('../evaluationData/frames.txt','a')
	frame_file.write(str(sent_file_name)+'\t'+'\t'.join(frames)+'\n')
	if not os.path.exists('../zimplCode/srl'+str(sent_file_name)+'.zpl'):
	   output_program_file = open('../zimplCode/srl'+str(sent_file_name)+'.zpl','w')
	else:
		output_program_file = open('../zimplCode/srl'+str(sent_file_name)+'.zpl','w')	
	fStr = "{"
	rStr = ''
	sStr = ''
	zStr = ''
	pStr = ''
	sumExprs = []
	uniqueStr = ''
	gStr = ''
	overlapStr = ''
	reqStr = ''
	excStr = ''
	for f in frames:
		fStr = fStr+'"'+f+'",'
		
	fStr = fStr.rstrip(',')+"};"
	output_program_file.write('# An autogenerated ZIMPL code to jointly map roles to spans for N number of frame in one sentence\n')
	output_program_file.write('set Frames := '+fStr+'\n')
	idx = 0
	sStr = sStr + '{"'+'","'.join(spans[frames[0]])+'"}'
	gStr = gStr + 'set G[I] := ' + buildSpanOverlapingSet(spans[frames[0]])
	for f in frames:
		rStr = rStr + ' <"'+f+'"> {"'+'","'.join(roles[f])+'"},'
		
		zStr = zStr + 'var z'+str(idx)+'[Assignment["'+f+'"]] binary;\n'
		pStr = pStr + 'param probabilities'+str(idx)+'[Assignment["'+f+'"]] := read "../frameData/frame'+str(idx)+'.txt" as "<1s,2s> 3n" skip 2;\n'
		sumExprs.append('sum <r,s> in Assignment["'+f+'"] : probabilities'+str(idx)+'[r,s] * z'+str(idx)+'[r,s]')
		uniqueStr = uniqueStr + 'subto unique'+str(idx)+ ': forall <r> in Roles["'+f+'"] do sum <s> in Spans : z'+str(idx)+'[r,s] == 1;\n'
		
		overlapStr = overlapStr + 'subto overlap' +str(idx)+ ': forall <i> in I do \n sum <r> in Roles["'+f+'"] do \n sum <s> in G[i] do z'+str(idx)+'[r,s] <= 1;\n'
		if requireDict.has_key(f):
			rqrFEs_str = requireDict[f]
			rqrFEs_list = [s.rstrip('">}').rstrip('"').rstrip('>').rstrip('}').rstrip().lstrip('"').lstrip('<').lstrip('{').lstrip().lstrip('<"') for s in str(rqrFEs_str.rstrip()[2:-2]).split(',')]
			#print exclFEs_list
			if all([a in roles[f] for a in rqrFEs_list]):
				reqStr = reqStr + 'set Reqr' +str(idx)+ ' := ' + requireDict[f].rstrip() +';\n' + 'subto require' +str(idx)+ ': forall <ri,rj> in Reqr'+ str(idx)+' do z'+str(idx)+'[ri,"-1_-1"] - z'+str(idx)+'[rj,"-1_-1"] == 0;\n'
				#print reqStr
		if exclusionDict.has_key(f):
			exclFEs_str = exclusionDict[f]
			exclFEs_list = [s.rstrip('">}').rstrip('"').rstrip('>').rstrip('}').rstrip().lstrip('"').lstrip('<').lstrip('{').lstrip().lstrip('<"') for s in str(exclFEs_str.rstrip()[2:-2]).split(',')]
			#print exclFEs_list
			if all([a in roles[f] for a in exclFEs_list]):
				excStr = excStr + 'set Exc' +str(idx)+ ' := ' + exclusionDict[f].rstrip() +';\n' + 'subto exclusion' +str(idx)+ ': forall <ri,rj> in Exc'+ str(idx)+' do z'+str(idx)+'[ri,"-1_-1"] + z'+str(idx)+'[rj,"-1_-1"] >= 1;\n'
				#print excStr
		
		idx = idx + 1
	
	frame_relation_dicts = build_frDicts()
	d = build_parent_child_frame_dict(frame_relation_dicts[1])
	subF2F_relation_str = f2fSubRelationConstraints(frames,roles,d)
	
	
	rStr = rStr.rstrip(',')+';\n'
	sStr = sStr.rstrip(',')+';\n'
	output_program_file.write('set Roles[Frames] := '+rStr)
	output_program_file.write('set Spans := '+sStr)
	output_program_file.write('set Assignment[<f> in Frames] := {Roles[f]*Spans};\n')
	output_program_file.write(zStr)
	output_program_file.write(pStr)
	output_program_file.write('\n #Objective Function \n')
	output_program_file.write('maximize assign : '+'+'.join(['('+ s + ')' for s in sumExprs])+';\n')
	output_program_file.write('#Constraints\n')
	output_program_file.write('#Overlap Constraints\n')
	output_program_file.write('set I := {0 to '+getLenSen(spans[frames[0]])+'};\n')

	output_program_file.write(gStr)
	output_program_file.write(overlapStr)
	output_program_file.write('#Uniqueness Constraint\n')
	output_program_file.write(uniqueStr)
	
	output_program_file.write('#pairwise exclusion constraint\n')
	output_program_file.write(excStr)	

	output_program_file.write('#pairwise requirement constraint\n')
	output_program_file.write(reqStr)
	
	#output_program_file.write(subF2F_relation_str)
	
	output_program_file.close()
	#print roles
	#print spans
	

def getLenSen(spans):
	#print spans
	N1 = []
	for s in spans:
		for i in s.split('_'):
			N1.append(int(i))
	return str(max(N1))

def buildSpanOverlapingSet(spans):
	N1 = []
	span_pairs = []
	for s in spans:
		span_pairs.append((int(s.split('_')[0]),int(s.split('_')[1])))
		for i in s.split('_'):
			N1.append(int(i))	
	
	minimum = min(N1)
	maximum = max(N1)
	N2 = range(0,maximum+1)
	G = []
	#print span_pairs
	for i in N2:
		#print i
		temp = []
		for (n,m) in span_pairs:
			
			if n <= i and m >=i:
				temp.append((n,m))
		G.append(temp)
		#print temp
	#print G
	tempStr = ''
	idx = 0
	for a in G:
		tempStr = tempStr + '<'+str(idx)+'> {'
		tempStr2 = ''
		for (n,m) in a:
			tempStr2 = tempStr2+'"'+str(n)+'_'+str(m)+'",'
		tempStr2.rstrip(',')
		tempStr = tempStr + tempStr2.rstrip(',') + '}, '
		idx = idx + 1
	tempStr = tempStr.rstrip(' ').rstrip(',')+';\n'
	
	return tempStr
	#set I := {1 to 11};
	#set G1[I] := <1> {"0_0","0_10"}, <2> {"1_1","0_10"}, <3> {"2_2","0_10","2_3","2_9"}, <4> {"3_3","0_10","2_3","2_9"}, <5> {"4_4","0_10","2_9","4_9"}, <6> {"5_5","0_10","2_9","4_9","5_9"}, <7> {"6_6","0_10","2_9","4_9","5_9"}, <8> {"7_7","0_10","2_9","4_9","5_9"}, <9> {"8_8","0_10","2_9","4_9","5_9"}, <10> {"9_9","0_10","2_9","4_9","5_9"}, <11> {"10_10","0_10"};
	#set G[<i> in I] := {<n1,n2> in ((I cross N2) inter N)  with n1 <= i and n2 >= i};
def buildRequirDict():
	reqDict = {}
	reqData = open('../data/require.map').readlines()
	for f in reqData:
		reqDict[f.split('=')[0]] = f.split('=')[1]
	return reqDict
def buildExclusionDict():
	excDict = {}
	excData = open('../data/exclusion.map').readlines()
	for f in excData:
		excDict[f.split('=')[0]] = f.split('=')[1]
	return excDict
def f2fSubRelationConstraints(frames,roles,d):
	frame_pairs_and_indexes = []
	for i in range(0,len(frames)):
		for j in range(i+1,len(frames)):
			if j < len(frames):
				frame_pairs_and_indexes.append(((frames[i],i),(frames[j],j)))
				#print ((frames[i],i),(frames[j],j))
	
	temp_str2 = ''
	idx = 0
	for ((f1,idx1),(f2,idx2)) in frame_pairs_and_indexes:
		
		if d.has_key(f1) and d.has_key(f2):
			(super_f1,(f1_l1,f1_l2)) = d[f1]
			(super_f2,(f2_l1,f2_l2)) = d[f2]
			#print 'this ' + str((f1,f2))
			#print roles[f1]
			#print roles[f2]
			if super_f1 == super_f2:
				
				related_fe_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
				print related_fe_pairs
				temp_str = ''
				for (e1,e2) in related_fe_pairs:
					if e1 in roles[f1] and e2 in roles[f2]:
						temp_str = temp_str +  '<"'+e1+'","'+e2+'">,'
				temp_str2 = temp_str2 + 'set subF2F' +str(idx)+ ' := ' + '{' + temp_str.rstrip(',') +'};\n' + 'subto subF2F' +str(idx)+ ': forall <ri,rj> in subF2F'+ str(idx)+' do z'+str(idx1)+'[ri,"-1_-1"] - z'+str(idx2)+'[rj,"-1_-1"] == 0;\n'
				#print 'set subF2F' +str(idx)+ ' := ' + requireDict[f].rstrip() +';\n' + 'subto require' +str(idx)+ ': forall <ri,rj> in Reqr'+ str(idx)+' do z'+str(idx)+'[ri,"-1_-1"] - z'+str(idx)+'[rj,"-1_-1"] == 0;\n'
				#roles[f1]
				#print (f1,f2)
				idx = idx + 1
	#print 'here'
	#print temp_str2
	return temp_str2

if __name__ == "__main__":
	import sys
	try:
		#generate_zimple_program(sys.argv[1])
		lecsie_db()
	except:
		print >>sys.stderr, __doc__
		raise