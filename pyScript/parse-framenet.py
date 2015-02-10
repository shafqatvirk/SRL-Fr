import itertools
import re
import os
import itertools
from frameRelationFuns import *
def read_all_docs():
	path="../../data/fndata-1.5/fulltext"  # insert the path to the directory of interest
	docsDictList = []
	dirList=os.listdir(path)
	for fname in dirList[1:]:
		#print fname
		tDict = read_doc('../../data/fndata-1.5/fulltext/'+fname)
		docsDictList.append(tDict)
	return docsDictList
def read_doc(doc):		
	sentences_frame_fes_dict = {}
	file_content = open(doc).read()
	#print file_content
	sentences_rex = re.compile(r'<sentence.*?</sentence>',re.S|re.M)
	sentence_id_rex = re.compile(r' ID="(\d+)">',re.S|re.M)
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
		frameAndFEs = []
		sentence_id = sentence_id_rex.findall(sentence_content)
		sentence_text = sentence_text_reg.findall(sentence_content)
		annotationSet_contents = annotationSet_rex.findall(sentence_content) 
		#print (sentence_text,sentence_id[0])
		#print
		#print annotationSet_contents[1]
		for annotationSet_content in annotationSet_contents:
			#print annotationSet_content
			frameName = frameAnnotation_rex.findall(annotationSet_content)
			#print isFrameName
			if frameName != []:
				#print "yes"
				frameElements_content = frameElements_rex.findall(annotationSet_content)
				tStart = []
				tEnd = []
				for frameElemt_content in frameElements_content:
					#print frameElemt_content
					if 'name="Target"/>\n' in frameElemt_content.split(' '):
						tStart = targetStart_rex.findall(frameElemt_content)
						tEnd = targetEnd_rex.findall(frameElemt_content)
						if tStart != [] and tEnd != []:
							target = tStart[0]+'-'+tEnd[0]
			
					if 'name="FE">\n' in frameElemt_content.split(' '):# and tStart != [] and tEnd != []:
						#print frameElemt_content
						fElements = feLabel_rex.findall(frameElemt_content)
						allFElements = []
						for element in fElements:
							name = feName_rex.findall(element)
							start = feStart_rex.findall(element)
							end = feEnd_rex.findall(element)
							if start != [] and end != []:
								allFElements.append((name[0]+':'+start[0]+'-'+end[0],target)) # to get target and fes as spans
								#allFElements.append((name[0]+':'+str(sentence_text[0][int(start[0]):int(end[0])+1]),target))
								#print (tStart,tEnd)
								#allFElements.append((name[0]+':'+str(sentence_text[0][int(start[0]):int(end[0])+1]),str(sentence_text[0][int(tStart[0]):int(tEnd[0])+1]))) # to get target and fes as span_text
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
	return sentences_frame_fes_dict
						
def get_setences_with_subRelationFrames(docs_dicts_list,subFrameRelation_dict):
	parent_child_frame_dict = build_parent_child_frame_dict(subFrameRelation_dict)
	#print parent_child_frame_dict
	for d in docs_dicts_list:
		#parent_child_frame_dict = build_parent_child_frame_dict(d)
		for (sen,sid) in d.keys():
			frame_and_fes_list = d[(sen,sid)]
			frames = [f for (f,fes) in frame_and_fes_list]
			felements = [fes for (f,fes) in frame_and_fes_list]
			haveF2F_relation = False
			for i in range(0,len(frames)):
				for j in range(i+1,len(frames)):
					if j < len(frames):
						if parent_child_frame_dict.has_key(frames[i]) and parent_child_frame_dict.has_key(frames[j]): 
							(f1_parent_frame,linked_fes1) = parent_child_frame_dict[frames[i]]
							(f2_parent_frame,linked_fes2) = parent_child_frame_dict[frames[j]]
							if f1_parent_frame == f2_parent_frame: # and frames[i] != frames[j]:
								#if frames[i] != frames[j]:
								#print frames
								#print d[(sen,sid)]
								#print (frames[i],frames[j],sen)
								#print sen
								#print ((frames[i],felements[i]),(frames[j],felements[j]))
								haveF2F_relation = True
					
								build_output_for_evaluation(frame_and_fes_list)
def get_setences_with_precedesRelationFrames(docs_dicts_list,precedesFrameRelation_dict):
	#parent_child_frame_dict = build_parent_child_frame_dict(precedesFrameRelation_dict)
	#print parent_child_frame_dict
	for d in docs_dicts_list:
		#parent_child_frame_dict = build_parent_child_frame_dict(d)
		for (sen,sid) in d.keys():
			frame_and_fes_list = d[(sen,sid)]
			frames = [f for (f,fes) in frame_and_fes_list]
			felements = [fes for (f,fes) in frame_and_fes_list]
			haveF2F_relation = False
			for i in range(0,len(frames)):
				for j in range(i+1,len(frames)):
					if j < len(frames):
						if precedesFrameRelation_dict.has_key((frames[i],frames[j])) or precedesFrameRelation_dict.has_key((frames[j],frames[i])):
								#print frames
								#print d[(sen,sid)]
								#print (frames[i],frames[j],sen)
								#print sen
								#print ((frames[i],felements[i]),(frames[j],felements[j]))
								haveF2F_relation = True
					
								build_output_for_evaluation(frame_and_fes_list) # to get gold
def get_setences_all(docs_dicts_list):
	for d in docs_dicts_list:
		#parent_child_frame_dict = build_parent_child_frame_dict(d)
		for (sen,sid) in d.keys():
			frame_and_fes_list = d[(sen,sid)]
			print sen		
			#build_output_for_evaluation(frame_and_fes_list)
def build_output_for_evaluation(frame_and_fes_list): #this is the gold
	allFrames = []
	for (f,fes) in frame_and_fes_list:
		allFrames.append(f+'$'+'#'.join([fe_span for (fe_span,target) in fes]))
	print '\t'.join(allFrames)
				
	
				
if __name__ == "__main__":
	import sys
	try:
		
		docs_dicts_list = read_all_docs()
		frame_relation_dicts = build_frDicts()
		get_setences_all(docs_dicts_list)
		#get_setences_with_subRelationFrames(docs_dicts_list,frame_relation_dicts[1]) # subFrame relation
		#get_setences_with_precedesRelationFrames(docs_dicts_list,frame_relation_dicts[0]) # inheritence relation
		#get_setences_with_precedesRelationFrames(docs_dicts_list,frame_relation_dicts[7]) # preceedes relation

	except:
		print >>sys.stderr, __doc__
		raise