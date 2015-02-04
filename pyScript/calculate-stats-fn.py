import itertools
import re
import os
import itertools
def build_frDicts():
	fr_file = open('../../data/fndata-1.5/frRelation.xml')
	#print fr_file.read()
	rex = re.compile(r'<frameRelationType.*?>\n(.*?)</frameRelationType>',re.S|re.M)
	#rex = re.compile(r'<frameRelationType (.*?)</frameRelationType>',re.S|re.M)
	relationType = rex.findall(fr_file.read())
	#print len(relationType)
	#print relationType	
	
	inhDict = buildDict(relationType[0])
	subFrameDict = buildDict(relationType[1])
	usingDict = buildDict(relationType[2])
	seeAlsoDict = buildDict(relationType[3])
	reFramingMapingDict = buildDict(relationType[4])
	inchoativeOfFrameDict = buildDict(relationType[5])
	causativeOfDict = buildDict(relationType[6])
	PrecedesDict = buildDict(relationType[7])
	PerspectiveOnDict = buildDict(relationType[8])
	#print inhDict
	return (inhDict,subFrameDict,usingDict,seeAlsoDict,reFramingMapingDict,inchoativeOfFrameDict,causativeOfDict,PrecedesDict,PerspectiveOnDict)
def buildDict(data):
	fRelation_rex = re.compile(r'<frameRelation(.*?)</frameRelation>',re.S|re.M)
	subFrame_rex = re.compile(r'subFrameName="(.*?)"',re.S|re.M)
	superFrame_rex = re.compile(r'superFrameName="(.*?)"',re.S|re.M)
	
	subFEName_rex = re.compile(r'subFEName="(.*?)"',re.S|re.M)
	superFEName_rex = re.compile(r'superFEName="(.*?)"',re.S|re.M)
	
	FrameRelationData = fRelation_rex.findall(data)
	#print FrameRelationData[0]
	tempDict = {}
	for fRelation in FrameRelationData:
		superFrame = superFrame_rex.findall(fRelation)
		subFrame = subFrame_rex.findall(fRelation)
		
		superFEList = superFEName_rex.findall(fRelation)
		subFEList = subFEName_rex.findall(fRelation)
		tempDict[(superFrame[0],subFrame[0])] = (superFEList,subFEList)
		#print superFrame[0]
		#print superFEList
		#print subFrame[0]
		#print subFEList
		#print
	return tempDict
	#fRelation_rex = re.compile(r'<frameRelation.*?>\n(.*?)</frameRelation>',re.S|re.M)
	#FERelation_rex.findall(data)
	
def find_stats(dicts):
	path="../../data/fndata-1.5/fulltext"  # insert the path to the directory of interest
	frameDataDictList = []
	dirList=os.listdir(path)
	inhRelationFrameCoExistance = []
	subRelationFrameCoExistance = []
	usingRelationFrameCoExistance = []
	seeAlsoRelationFrameCoExistance = []
	reFramingMappingRelationFrameCoExistance = []
	incoativOfRelationFrameCoExistance = []
	causativeOfRelationFrameCoExistance = []
	precedesRelationFrameCoExistance = []
	perspectiveOnRelationFrameCoExistance = []
	
	inhMatchesList= []
	inhUnMatchesList= []
	subMatchesList = []
	subUnMatchesList = []
	usingMatchesList = []
	usingUnMatchesList = []
	seeAlsoMatchesList = []
	seeAlsoUnMatchesList = []
	reFramingMappingMatchesList = []
	reFramingMappingUnMatchesList = []
	incoativOfMatchesList = []
	incoativOfUnMatchesList = []
	causativeOfMatchesList = []
	causativeOfUnMatchesList = []
	precedesMatchesList = []
	precedesUnMatchesList = []
	perspectiveOnMatchesList = []
	perspectiveOnUnMatchesList = []
	
	n = 0
	for fname in dirList:
		#print fname
		tDict = find_doc_stats('../../data/fndata-1.5/fulltext/'+fname)
		#n = n + len(tDict.keys())
		#print len(tDict.keys())
		frameDataDictList.append(tDict)
	super_sub_Frame_Dict = build_parent_child_frame_dict(dicts[1])
	for l in frameDataDictList:
		for d in l:
		#print d
		#print
			for (f1,f2) in list(itertools.product(d.keys(),d.keys())):
				if f1 != f2:
					#test(f1,f2,d,super_sub_Frame_Dict)
					test_empty(f1,f2,d,super_sub_Frame_Dict)
				if (f1,f2) in dicts[0]:
					#print f1
					#print f2
					#print 
					inhRelationFrameCoExistance.append((f1,f2))
					#print f1 + ':' + str(d[f1])
					#print f2 + ':' + str(d[f2])
					#print dicts[0][(f1,f2)]
					(inhMatches,inhUnMatches) = matchingFrameElements(dicts[0],d,f1,f2)
					if inhMatches != None and inhMatches != []:
						inhMatchesList.append(inhMatches)
					if inhUnMatches != None and inhUnMatches != []:
						inhUnMatchesList.append(inhUnMatches)
				
				if (f1,f2) in dicts[1]:
					subRelationFrameCoExistance.append((f1,f2))
					(subMatches,subUnMatches) = matchingFrameElements(dicts[1],d,f1,f2)
					if subMatches != None and subMatches != []:
						subMatchesList.append(subMatches)
					if subUnMatches != None and subUnMatches != []:
						subUnMatchesList.append(subUnMatches)
				if (f1,f2) in dicts[2]:
					usingRelationFrameCoExistance.append((f1,f2))
					(usingMatches,usingUnMatches) = matchingFrameElements(dicts[2],d,f1,f2)
					if usingMatches != None and usingMatches != []:
						usingMatchesList.append(usingMatches)
					if usingUnMatches != None and usingUnMatches != []:
						usingUnMatchesList.append(usingUnMatches)
				if (f1,f2) in dicts[3]:
					seeAlsoRelationFrameCoExistance.append((f1,f2))
					(seeAlsMatches,seeAlsUnMatches) = matchingFrameElements(dicts[3],d,f1,f2)
					if seeAlsMatches != None and seeAlsMatches != []:
						seeAlsoMatchesList.append(seeAlsMatches)
					if seeAlsUnMatches != None and seeAlsUnMatches != []:
						seeAlsoUnMatchesList.append(seeAlsUnMatches)
				if (f1,f2) in dicts[4]:
					reFramingMappingRelationFrameCoExistance.append((f1,f2))
					(reFramingMappingMatches,reFramingMappingUnMatches) = matchingFrameElements(dicts[4],d,f1,f2)
					if reFramingMappingMatches != None and reFramingMappingMatches != []:
						reFramingMappingMatchesList.append(reFramingMappingMatches)
					if reFramingMappingUnMatches != None and reFramingMappingUnMatches != []:
						reFramingMappingUnMatchesList.append(reFramingMappingUnMatches)
				if (f1,f2) in dicts[5]:
					incoativOfRelationFrameCoExistance.append((f1,f2))
					(incoativOfMatches,incoativOfUnMatches) = matchingFrameElements(dicts[5],d,f1,f2)
					if incoativOfMatches != None and incoativOfMatches != []:
						incoativOfMatchesList.append(incoativOfMatches)
					if incoativOfUnMatches != None and incoativOfUnMatches != []:
						incoativOfUnMatchesList.append(incoativOfUnMatches)
				if (f1,f2) in dicts[6]:
					causativeOfRelationFrameCoExistance.append((f1,f2))
					(causativeOfMatches,causativeOfUnMatches) = matchingFrameElements(dicts[6],d,f1,f2)
					if causativeOfMatches != None and causativeOfMatches != []:
						causativeOfMatchesList.append(causativeOfMatches)
					if causativeOfUnMatches != None and causativeOfUnMatches != []:
						causativeOfUnMatchesList.append(causativeOfUnMatches)
				if (f1,f2) in dicts[7]:
					precedesRelationFrameCoExistance.append((f1,f2))
					(precedesMatches,precedesUnMatches) = matchingFrameElements(dicts[7],d,f1,f2)
					if precedesMatches != None and precedesMatches != []:
						precedesMatchesList.append(precedesMatches)
					if precedesUnMatches != None and precedesUnMatches != []:
						precedesUnMatchesList.append(precedesUnMatches)
				if (f1,f2) in dicts[8]:
					perspectiveOnRelationFrameCoExistance.append((f1,f2))
					(perspectiveOnMatches,perspectiveOnUnMatches) = matchingFrameElements(dicts[8],d,f1,f2)
					if perspectiveOnMatches != None and perspectiveOnMatches != []:
						perspectiveOnMatchesList.append(perspectiveOnMatches)
					if perspectiveOnUnMatches != None and perspectiveOnUnMatches != []:
						perspectiveOnUnMatchesList.append(perspectiveOnUnMatches)
			
			#print (f1,f2)
	
	#output_general_stats(frameDataDictList,inhMatchesList,inhUnMatchesList,subMatchesList,subUnMatchesList,usingMatchesList,usingUnMatchesList,seeAlsoMatchesList,seeAlsoUnMatchesList,reFramingMappingMatchesList,reFramingMappingUnMatchesList,incoativOfMatchesList,incoativOfUnMatchesList,causativeOfMatchesList,causativeOfUnMatchesList,precedesMatchesList,precedesUnMatchesList,perspectiveOnMatchesList,perspectiveOnUnMatchesList)
	#output_stats('Inheritence',inhMatchesList,inhUnMatchesList)
	#output_stats('SubFrame',subMatchesList,subUnMatchesList)
	#output_stats('Using Frame',usingMatchesList,usingUnMatchesList)
	#output_stats('SeeAlso',seeAlsoMatchesList,seeAlsoUnMatchesList)
	#output_stats('reFraming Mapping',reFramingMappingMatchesList,reFramingMappingUnMatchesList)
	#output_stats('IncoativeOf',incoativOfMatchesList,incoativOfUnMatchesList)
	#output_stats('CausativeOf',causativeOfMatchesList,causativeOfUnMatchesList)
	#output_stats('Precedes',precedesMatchesList,precedesUnMatchesList)
	#output_stats('PerspectiveOn',perspectiveOnMatchesList,perspectiveOnUnMatchesList)
def test(f1,f2,d,super_sub_frame_dict):
	if super_sub_frame_dict.has_key(f1) and super_sub_frame_dict.has_key(f2) and f1 != f2:
		(p1,fep1) = super_sub_frame_dict[f1]
		(p2,fep2) = super_sub_frame_dict[f2]
		if p1 == p2:
			
		#if super_sub_frame_dict[f1] == super_sub_frame_dict[f2]:
			#l1 = [e1 for (e1,text1,target1) in d[f1]]
			#l2 = [e2 for (e2,text2,target2) in d[f2]]
			#(fe2_fe,fe2_span,fe2_text,fe2_frame,fe2_target) = (fe2[0],fe2[1],fe2[2],fe2[3],fe2[4])
			#for e in l1:
			#	if e in l2:
			#		print e
			#		print
			common_list = list(set(zip(fep1[0],fep1[1])).intersection(zip(fep2[0],fep2[1])))
			#print fep1
			#print fep2
			#print 
			for (pfer1,pfer2) in common_list:
				#print pfer1
				#print pfer2
				if pfer1 in [e.split(':')[0] for (e,t,tr) in d[f1]] and pfer2 in [e2.split(':')[0] for (e2,t2,tr2) in d[f2]]:
					print '%-25s%-25s%-15s%-120s%-30s%s'%('Frame','Frame Element','Span','Span Text','Trigger','Sentence')	
					for (e,t,tr) in d[f1]:
						if e.split(':')[0] == pfer1:
				#for (e,t,tr) in d[f1]:
							print '%-25s%-25s%-15s%-120s%-30s%s'%(f1,e.split(':')[0],e.split(':')[1],t[0][int(e.split(':')[1].split('-')[0]):int(e.split(':')[1].split('-')[1])+1],t[0][int(tr.split('-')[0]):int(tr.split('-')[1])+1],t)
							s1 = e.split(':')[1]
				#for (e,t,tr) in d[f2]:
					for (e,t,tr) in d[f2]:
						if e.split(':')[0] == pfer2:
							print '%-25s%-25s%-15s%-120s%-30s%s'%(f2,e.split(':')[0],e.split(':')[1],t[0][int(e.split(':')[1].split('-')[0]):int(e.split(':')[1].split('-')[1])+1],t[0][int(tr.split('-')[0]):int(tr.split('-')[1])+1],t)
							s2 = e.split(':')[1]
					if s1 == s2:
						print '\t**MATCH**'
					else:
						print '\t**MISSMATCH**'
				
					print '======================================================================================================================================================================================================='
				
def test_empty(f1,f2,d,super_sub_frame_dict):
	if super_sub_frame_dict.has_key(f1) and super_sub_frame_dict.has_key(f2) and f1 != f2:
		(p1,fep1) = super_sub_frame_dict[f1]
		(p2,fep2) = super_sub_frame_dict[f2]
		if p1 == p2:
			#print 'total'
		#if super_sub_frame_dict[f1] == super_sub_frame_dict[f2]:
			#l1 = [e1 for (e1,text1,target1) in d[f1]]
			#l2 = [e2 for (e2,text2,target2) in d[f2]]
			#(fe2_fe,fe2_span,fe2_text,fe2_frame,fe2_target) = (fe2[0],fe2[1],fe2[2],fe2[3],fe2[4])
			#for e in l1:
			#	if e in l2:
			#		print e
			#		print
			common_list = list(set(zip(fep1[0],fep1[1])).intersection(zip(fep2[0],fep2[1])))
			#print len(common_list)
			#print fep1
			#print fep2
			#print 
			for (pfer1,pfer2) in common_list:
				#print pfer1
				#print pfer2
				if pfer1 in [e.split(':')[0] for (e,t,tr) in d[f1]]:
					if pfer2 not in [e2.split(':')[0] for (e2,t2,tr2) in d[f2]]:
						print '%-25s%-25s%-15s%-120s%-30s%s'%('Frame','Frame Element','Span','Span Text','Trigger','Sentence')	
						for (e,t,tr) in d[f1]:
							if e.split(':')[0] == pfer1:
				#for (e,t,tr) in d[f1]:
								print '%-25s%-25s%-15s%-120s%-30s%s'%(f1,e.split(':')[0],e.split(':')[1],t[0][int(e.split(':')[1].split('-')[0]):int(e.split(':')[1].split('-')[1])+1],t[0][int(tr.split('-')[0]):int(tr.split('-')[1])+1],t)
								print '%-25s%-25s'%(f2,pfer2)
								print 'e1 non-emply e2 empty'
								s1 = e.split(':')[1]
						print '======================================================================================================================================================================================================='
	
				#for (e,t,tr) in d[f2]:
				if pfer1 not in [e.split(':')[0] for (e,t,tr) in d[f1]]:
					if pfer2 in [e2.split(':')[0] for (e2,t2,tr2) in d[f2]]:
						for (e,t,tr) in d[f2]:
							if e.split(':')[0] == pfer2:
								print '%-25s%-25s'%(f1,pfer1)
								print '%-25s%-25s%-15s%-120s%-30s%s'%(f2,e.split(':')[0],e.split(':')[1],t[0][int(e.split(':')[1].split('-')[0]):int(e.split(':')[1].split('-')[1])+1],t[0][int(tr.split('-')[0]):int(tr.split('-')[1])+1],t)
								
								print 'e1 empty e2 non-empty'
								s2 = e.split(':')[1]
						print '======================================================================================================================================================================================================='
					#if s1 == s2:
					#	print '\t**MATCH**'
					#else:
					#	print '\t**MISSMATCH**'
				
				
				
				#print
def build_parent_child_frame_dict(d):
	temp_dict = {}
	for (p,c) in d.keys():
		temp_dict[c] = (p,d[(p,c)])
	return temp_dict
def output_general_stats(frameDataDictList,inhMatchesList,inhUnMatchesList,subMatchesList,subUnMatchesList,usingMatchesList,usingUnMatchesList,seeAlsoMatchesList,seeAlsoUnMatchesList,reFramingMappingMatchesList,reFramingMappingUnMatchesList,incoativOfMatchesList,incoativOfUnMatchesList,causativeOfMatchesList,causativeOfUnMatchesList,precedesMatchesList,precedesUnMatchesList,perspectiveOnMatchesList,perspectiveOnUnMatchesList):
	tFrames = 0
	for ltdict in frameDataDictList:
		for tdict in ltdict:
			tFrames = tFrames + len(tdict.keys())
	tMatchingFrames = len(inhMatchesList)+len(subMatchesList)+len(usingMatchesList)+len(seeAlsoMatchesList)+len(reFramingMappingMatchesList)+len(incoativOfMatchesList)+len(causativeOfMatchesList)+len(precedesMatchesList)+len(perspectiveOnMatchesList)
	tUnMatchingFrames = len(inhUnMatchesList)+len(subUnMatchesList)+len(usingUnMatchesList)+len(seeAlsoUnMatchesList)+len(reFramingMappingUnMatchesList)+len(incoativOfUnMatchesList)+len(causativeOfUnMatchesList)+len(precedesUnMatchesList)+len(perspectiveOnUnMatchesList)
		
	print 'Total Number of Frames='+str(tFrames)
	print 'Total Number of Frames with Matching Spans='+str(tMatchingFrames)
	print 'Total Number of Frames with UnMatching Spans='+str(tUnMatchingFrames)
def output_stats(rType,matchData,unmatchData):
	print 'Frame 2 Frame Relation:  '+rType
	print 'Total number of frames with matching Spans='+str(len(matchData))
	print 'Total number of Frames with unmatching Spans='+str(len(unmatchData))
	print '====================================================================='
	print
	print 'With matching Spans'
	print '%-25s%-25s%-15s%-120s%-30s%s'%('Frame','Frame Element','Span','Span Text','Trigger','Sentence')
	print '======================================================================================================================================================================================================================'
	for (fe1,fe2) in list(itertools.chain.from_iterable(matchData)):
		#print fe1
		#print fe2
		fe1_fe = fe1[0]
		fe1_span = fe1[1]
		fe1_text = fe1[2]
		fe1_frame = fe1[3]
		fe1_target = fe1[4]
		(fe2_fe,fe2_span,fe2_text,fe2_frame,fe2_target) = (fe2[0],fe2[1],fe2[2],fe2[3],fe2[4])
		print '%-25s%-25s%-15s%-120s%-30s%s'%(fe1_frame,fe1_fe,fe1_span,fe1_text[int(fe1_span.split('-')[0]):int(fe1_span.split('-')[1])+1],fe1_text[int(fe1_target.split('-')[0]):int(fe1_target.split('-')[1])+1],fe1_text)
		print '%-25s%-25s%-15s%-120s%-30s%s'%(fe2_frame,fe2_fe,fe2_span,fe2_text[int(fe2_span.split('-')[0]):int(fe2_span.split('-')[1])+1],fe2_text[int(fe2_target.split('-')[0]):int(fe2_target.split('-')[1])+1],fe2_text)
		#print fe1_frame + '\t'+ fe1_fe +'\t ' + fe1_span + '\t' + fe1_text[int(fe1_span.split('-')[0]):int(fe1_span.split('-')[1])+1] + '\t' + fe1_text
		#print fe2_frame + '\t'+ fe2_fe +'\t ' + fe2_span + '\t' + fe2_text[int(fe2_span.split('-')[0]):int(fe2_span.split('-')[1])+1] + '\t' + fe2_text
		print '-----------------------------------------------------------------------------------------------------------'
	print
	print '*********************************************************************************************************************************************************************************************************************'
	print 'With Un-matching Spans'
	print '%-25s%-25s%-15s%-120s%-30s%s'%('Frame','Frame Element','Span','Span Text','Trigger','Sentence')
	print '====================================================================================================================================================================================================================='
	for (fe1,fe2) in list(itertools.chain.from_iterable(unmatchData)):
		#print fe1
		#print fe2
		fe1_fe = fe1[0]
		fe1_span = fe1[1]
		fe1_text = fe1[2]
		fe1_frame = fe1[3]
		fe1_target = fe1[4]
		(fe2_fe,fe2_span,fe2_text,fe2_frame,fe2_target) = (fe2[0],fe2[1],fe2[2],fe2[3],fe2[4])
		print '%-25s%-25s%-15s%-120s%-30s%s'%(fe1_frame,fe1_fe,fe1_span,fe1_text[int(fe1_span.split('-')[0]):int(fe1_span.split('-')[1])+1],fe1_text[int(fe1_target.split('-')[0]):int(fe1_target.split('-')[1])+1],fe1_text)
		print '%-25s%-25s%-15s%-120s%-30s%s'%(fe2_frame,fe2_fe,fe2_span,fe2_text[int(fe2_span.split('-')[0]):int(fe2_span.split('-')[1])+1],fe2_text[int(fe2_target.split('-')[0]):int(fe2_target.split('-')[1])+1],fe2_text)
		#print fe1_frame + '\t'+ fe1_fe +'\t ' + fe1_span + '\t' + fe1_text[int(fe1_span.split('-')[0]):int(fe1_span.split('-')[1])+1] + '\t' + fe1_text
		#print fe2_frame + '\t'+ fe2_fe +'\t ' + fe2_span + '\t' + fe2_text[int(fe2_span.split('-')[0]):int(fe2_span.split('-')[1])+1] + '\t' + fe2_text
		print '-----------------------------------------------------------------------------------------------------------'		
def matchingFrameElements(dicts,d,f1,f2):
	tdict1 = {}
	tdict2 = {}
	matchedList = []
	unMatchedList = []
	for (e,t,target) in d[f1]:
		tdict1[e.split(':')[0]] = (e.split(':')[1],t,target)
	for (e,t,target) in d[f2]:
		tdict2[e.split(':')[0]] = (e.split(':')[1],t,target)
				
		(felist1,felist2) = dicts[(f1,f2)]
					
		for (e1,e2) in zip(felist1,felist2):
			if tdict1.has_key(e1) and tdict2.has_key(e2):
				(s1,text1,t1) = tdict1[e1]
				(s2,text2,t2) = tdict2[e2]
				#print text1[0]
				#print text2[0]
				#print 
				#if tdict1[e1] == tdict2[e2]:
				if s1 == s2:
					#matchedList.append((e1+':'+tdict1[e1]+':'+str(text1[0]),e2+':'+tdict2[e2]+':'+str(text2[0])))
					matchedList.append(([e1,s1,text1[0],f1,t1],[e2,s2,text2[0],f2,t2]))
					#return (e1+':'+tdict1[e1]+':'+str(text1[0]),e2+':'+tdict2[e2]+':'+str(text2[0]))
				else:
					unMatchedList.append(([e1,s1,text1[0],f1,t1],[e2,s2,text2[0],f2,t2]))
					#print e1+':'+tdict1[e1]
					#print e2+':'+tdict2[e2]
	return (matchedList,unMatchedList)
def find_doc_stats(doc):
	
	frameAndFE_dict_list = []
	file_content = open(doc).read()
	#print file_content
	sentences_rex = re.compile(r'<sentence.*?</sentence>',re.S|re.M)
	annotationSet_rex = re.compile(r'<annotationSet.*?</annotationSet>',re.S|re.M)
	frameAnnotation_rex = re.compile(r'frameName="(.*?)"',re.S|re.M)
	frameElements_rex = re.compile(r'<layer.*?</layer>',re.S|re.M)
	feLabel_rex = re.compile(r'<label.*?/>',re.S|re.M)
	feName_rex = re.compile(r'name="(.*?)"',re.S|re.M)
	feStart_rex = re.compile(r'start="(.*?)"',re.S|re.M)
	feEnd_rex = re.compile(r'end="(.*?)"',re.S|re.M)
	sentence_text_reg = re.compile(r'<text>(.*?)</text>',re.S|re.M)
	targetStart_rex = re.compile(r'start="(.*?)"',re.S|re.M)
	targetEnd_rex = re.compile(r'end="(.*?)"',re.S|re.M)
	
	sentences_content = sentences_rex.findall(file_content)
	#print sentences_content
	for sentence_content in sentences_content:
		#print sentence_content
		frameAndFE_dict = {}
		sentence_text = sentence_text_reg.findall(sentence_content)
		annotationSet_contents = annotationSet_rex.findall(sentence_content)
		#print annotationSet_contents[1]
		for annotationSet_content in annotationSet_contents:
			#print annotationSet_content
			isFrameName = frameAnnotation_rex.findall(annotationSet_content)
			#print isFrameName
			if isFrameName != []:
				#print "yes"
				frameElements_content = frameElements_rex.findall(annotationSet_content)
				for frameElemt_content in frameElements_content:
					#print frameElemt_content
					if 'name="Target"/>\n' in frameElemt_content.split(' '):
						tStart = targetStart_rex.findall(frameElemt_content)
						tEnd = targetEnd_rex.findall(frameElemt_content)
						if tStart != [] and tEnd != []:
							target = tStart[0]+'-'+tEnd[0]
					if 'name="FE">\n' in frameElemt_content.split(' '):
						#print frameElemt_content
						fElements = feLabel_rex.findall(frameElemt_content)
						allFElements = []
						for element in fElements:
							name = feName_rex.findall(element)
							start = feStart_rex.findall(element)
							end = feEnd_rex.findall(element)
							if start != [] and end != []:
								allFElements.append((name[0]+':'+start[0]+'-'+end[0],sentence_text,target))
							#print isFrameName[0]
							#print name
							#print start
							#print end
							#print
						frameAndFE_dict[isFrameName[0]] = allFElements
		if frameAndFE_dict:
			frameAndFE_dict_list.append(frameAndFE_dict)
	#print frameAndFE_dict
	#return frameAndFE_dict
	return frameAndFE_dict_list
						
					
				
if __name__ == "__main__":
	import sys
	try:
		dicts = build_frDicts()
		find_stats(dicts)

	except:
		print >>sys.stderr, __doc__
		raise