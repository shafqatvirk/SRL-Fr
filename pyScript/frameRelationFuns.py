import re
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
	return temp_dict