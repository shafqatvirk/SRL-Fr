import re
import os
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

def build_parent_child_frame_dict(d):
	temp_dict = {}
	for (p,c) in d.keys():
		temp_dict[c] = (p,d[(p,c)])
	return temp_dic

def read_all_docs_fn():
	path="../../data/fndata-1.5/fulltext"  # insert the path to the directory of interest
	docsDictList = []
	dirList=os.listdir(path)
	for fname in dirList[1:]:
		#print fname
		tDict = read_doc_fn('../../data/fndata-1.5/fulltext/'+fname)
		docsDictList.append(tDict)
	return docsDictList
def read_doc_fn(doc):		
	sentences_frame_fes_dict = {}
	file_content = open(doc).read()
	#print file_content
	sentences_rex = re.compile(r'<sentence.*?</sentence>',re.S|re.M)
	sentence_id_rex = re.compile(r' ID="(\d+)">',re.S|re.M)
	annotationSet_rex = re.compile(r'<annotationSet.*?</annotationSet>',re.S|re.M)
	frameAnnotation_rex = re.compile(r'frameName="(.*?)"',re.S|re.M)
	
	frameTarget_rex = re.compile(r'luName="(.*?)"',re.S|re.M)
	
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
		frameAndFEs = []
		sentence_id = sentence_id_rex.findall(sentence_content)
		sentence_text = sentence_text_reg.findall(sentence_content)
		annotationSet_contents = annotationSet_rex.findall(sentence_content) 
		#print (sentence_text,sentence_id[0])
		#print
		#print annotationSet_contents[1]
		for annotationSet_content in annotationSet_contents:
			#print annotationSet_content
			frameTarget = []
			frameName = frameAnnotation_rex.findall(annotationSet_content)
			
			frameTarget = frameTarget_rex.findall(annotationSet_content) # use either this or targetStart_rex and targetEng_reg
			#print frameTarget
			if frameName != [] and frameTarget != []:
				#print "yes"
				frameElements_content = frameElements_rex.findall(annotationSet_content)
				tStart = []
				tEnd = []
				for frameElemt_content in frameElements_content:
					#dont use this if we have used frameTarget_rex
					'''if 'name="Target"/>\n' in frameElemt_content.split(' '):
						tStart = targetStart_rex.findall(frameElemt_content)
						tEnd = targetEnd_rex.findall(frameElemt_content)
						if tStart != [] and tEnd != []:
							target = tStart[0]+'-'+tEnd[0]'''
			
					if 'name="FE">\n' in frameElemt_content.split(' '):# and tStart != [] and tEnd != []:
						#print frameElemt_content
						fElements = feLabel_rex.findall(frameElemt_content)
						allFElements = []
						for element in fElements:
							name = feName_rex.findall(element)
							start = feStart_rex.findall(element)
							end = feEnd_rex.findall(element)
							if start != [] and end != []:
								allFElements.append((name[0]+':'+start[0]+'-'+end[0],frameTarget[0]))
								#allFElements.append((name[0]+':'+str(sentence_text[0][int(start[0]):int(end[0])+1]),target))
								#print (tStart,tEnd)
								#allFElements.append((name[0]+':'+str(sentence_text[0][int(start[0]):int(end[0])+1]),str(sentence_text[0][int(tStart[0]):int(tEnd[0])+1])))
							#print isFrameName[0]
							#print name
							#print start
							#print end
							#print
						if allFElements != []:
							frameAndFEs.append((frameName[0], allFElements))
		
		if frameAndFEs != []:
			sentences_frame_fes_dict[(sentence_text[0],sentence_id[0])] = frameAndFEs
	'''for k in sentences_frame_fes_dict.keys():
		print k
		print sentences_frame_fes_dict[k]
		print'''
		#return frameAndFE_dict
	#print sentences_frame_fes_dict
	return sentences_frame_fes_dict
