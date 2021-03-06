import itertools
import re
import os
import itertools
from frameRelationFuns import *
from nltk.stem.porter import *

def data_for_evaluation():
	path="../output/"  # insert the path to the directory of interest
	docsDictList = []
	dirList=os.listdir(path)
	frames = open('../evaluationData/frames.txt')
	final_list = [None] * len(dirList[1:])
	#print len(final_list)
	for fname in dirList[1:]:
		#print fname
		idx = int(fname.split('-')[1].split('.')[0])
		#print idx
		final_list[idx] = read_doc('../output/'+fname,frames.readline(),idx)
	for i in range(0,len(final_list)):
		print final_list[i]
		
def read_doc(doc,frames,sent_id):
	#print frames
	sentences_frame_fes_dict = {}
	file_content = open(doc).read()
	#print file_content
	solution_rex = re.compile(r'primal solution:\n.*?Statistics\n',re.S|re.M)

	solution = solution_rex.findall(file_content)
	#print doc
	#print solution
	#print frames
	all_frames_list = []
	for l in solution[0].split('\n')[4:-3]:
		#print l
		fes_list = l.split(' ')[0].split('$')
		#all_frames_list.append((frames.split('\t')[int(fes_list[0][1:])+1].rstrip(),fes_list[1],fes_list[2]))
		all_frames_list.append((fes_list[0].rstrip(),fes_list[1],fes_list[2]))
	full_list = []
	temp_list = [(key, [(fe,span) for (f,fe,span) in value]) for key, value in itertools.groupby(all_frames_list, lambda x: x[0])]
	full_list = replace_z_by_frameName(temp_list,frames)
	return '\t'.join(full_list)
	#print '\t'.join(full_list)
		#print (frames.split('\t')[int(fes_list[0][1:])+1].rstrip(),fes_list[1],fes_list[2])
def replace_z_by_frameName(temp_list,frames):
	t_list = []
	for (frame,fes_list) in temp_list:
		t = frames.split('\t')[int(frame[1:])+1].rstrip()+'$'+'#'.join([fe+':'+span for (fe,span) in fes_list])
		#print (frame,t)
		t_list.append(t)
	return t_list

def data_for_evaluation_only_replacements():
	frame_relation_dicts = build_frDicts()
	d = build_parent_child_frame_dict(frame_relation_dicts[7])
	data = open('../evaluationData/without-f2f-constraints-precedes.txt')
	for l in data.readlines()[0:]:
		frames_data = l.rstrip().split('\t')
		frame_data_list = []
		for frame in frames_data:
			frame_name = frame.split('$')[0]
			fes = frame.split('$')[1]
			fes_data_list = []
			for fe in fes.split('#'):
				fe_name = fe.split(':')[0]
				fe_span = fe.split(':')[1]
				fes_data_list.append((fe_name,fe_span))
			frame_data_list.append((frame_name,fes_data_list))
		updated_list = role_fillings(frame_data_list,d)
		
		print '\t'.join([(uframe+'$'+'#'.join([ufe_name+':'+ufe_span for (ufe_name,ufe_span) in ufes_list])) for  (uframe,ufes_list) in updated_list])
def role_fillings(frame_data_list,frame_relation_dict):
	'''print 'Full Frame List'
	print frame_data_list
	print '*********************'
	print 'Role Filling'
	print '''
	for i in range(0,len(frame_data_list)):
		for j in range(i+1,len(frame_data_list)):
			if j < len(frame_data_list):
				(f1,f1_fes_list) = frame_data_list[i]
				(f2,f2_fes_list) = frame_data_list[j]
				#print (f1,f2)
				#print
				if frame_relation_dict.has_key(f1) and frame_relation_dict.has_key(f2):
					(f1_parent,(f1_l1,f1_l2)) = frame_relation_dict[f1]
					(f2_parent,(f2_l1,f2_l2)) = frame_relation_dict[f2]
					#print (f1,f2)
					if f1_parent == f2_parent:
						
						related_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
						#print related_pairs
						#print '*************'
						for (f1_fe,f2_fe) in related_pairs:
							
							f1_name = ''
							f1_span = ''
							f2_name = ''
							f2_span = ''
							f1_span_temp = ''
							f2_span_temp = ''
							for m in range(0,len(f1_fes_list)):
								(f_name,f_span) = f1_fes_list[m]
								if f_name == f1_fe:
									f1_name = f_name
									f1_span = f_span
									idx1 = m
									break
							for n in range(0,len(f2_fes_list)):
								(f_name,f_span) = f2_fes_list[n]
								if f_name == f2_fe:
									f2_name = f_name
									f2_span = f_span
									idx2 = n
									break
							if f1_span != '' and f1_span == '-1_-1' and f2_span != '-1_-1' and f2_span != '':
								'''print 'Before Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role to be Filled:'+str((f1_name,f2_span))
								#print '//////////////'
								print '''
								f1_fes_list[idx1] = (f1_name,f2_span)
								'''print 'After Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role Filled:'+str((f1_name,f2_span))
								#print '//////////////'
								print''' 
							elif f2_span != '' and f2_span == '-1_-1' and f1_span != '-1_-1' and f1_span != '':
								'''print 'Before Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role to be Filled:'+str((f2_name,f1_span))
								#print '++++++++++++++++'
								print'''
								f2_fes_list[idx2] = (f2_name,f1_span)
								'''print 'After Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role Filled:'+str((f2_name,f1_span))
								#print '++++++++++++++++'
								print''' 
				frame_data_list[i] = (f1,f1_fes_list)
				frame_data_list[j] = (f2,f2_fes_list)
	'''print '******************'
	#print 'After'
	#print frame_data_list'''
	return frame_data_list
###################################							
def data_for_evaluation_only_replacements_juliette():
	frame_relation_dicts = build_frDicts()
	d = build_parent_child_frame_dict(frame_relation_dicts[0])
	julitte_dict = build_juliette_database_dict()
	#print julitte_dict
	triggers_file = open('../triggersData/triggers.txt')
	#print d
	data = open('../evaluationData/without-f2f-constraints-inheritance.txt')
	for (l,triggers) in zip(data.readlines(),triggers_file.readlines()):
		frames_data = l.rstrip().split('\t')
		triggers_data = triggers.split('\t')[1:]
		#print zip(frames_data,triggers_data)
		frame_data_list = []
		for (frame,trigger) in zip(frames_data,triggers_data):
			frame_name = frame.split('$')[0]
			fes = frame.split('$')[1]
			fes_data_list = []
			for fe in fes.split('#'):
				fe_name = fe.split(':')[0]
				fe_span = fe.split(':')[1]
				fes_data_list.append((fe_name,fe_span))
			frame_data_list.append((frame_name,trigger,fes_data_list))
		updated_list = role_fillings_juliette(frame_data_list,d,julitte_dict)
		
		#print '\t'.join([(uframe+'$'+'#'.join([ufe_name+':'+ufe_span for (ufe_name,ufe_span) in ufes_list])) for  (uframe,utarget,ufes_list) in updated_list])

def role_fillings_juliette(frame_data_list,frame_relation_dict,juliette_relation_dict):
	stemmer = PorterStemmer()
	'''print 'Full Frame List'
	print frame_data_list
	print '*********************'
	print 'Role Filling'
	print''' 
	for i in range(0,len(frame_data_list)):
		for j in range(i+1,len(frame_data_list)):
			if j < len(frame_data_list):
				#print i
				#print frame_data_list[i]
				(f1,t1,f1_fes_list) = frame_data_list[i]
				(f2,t2,f2_fes_list) = frame_data_list[j]
				#print (f1,f2)
				#print
				t1_lemma = t1.split('.')[0]
				t1_pos = t1.split('.')[1]
				
				t2_lemma = t2.split('.')[0]
				t2_pos = t2.split('.')[1]
				#print 'Stemmed'
				
				t1_stemmed = str(stemmer.stem(t1_lemma))
				t2_stemmed = str(stemmer.stem(t2_lemma).lstrip())
				#print (t1_stemmed,t2_stemmed)
				if ((juliette_relation_dict.has_key((t1_stemmed,t2_stemmed)) or juliette_relation_dict.has_key((t2_stemmed,t1_stemmed)))) and frame_relation_dict.has_key(f1) and frame_relation_dict.has_key(f2) and t1_pos == 'v' and t2_pos == 'v':
					(f1_parent,(f1_l1,f1_l2)) = frame_relation_dict[f1]
					(f2_parent,(f2_l1,f2_l2)) = frame_relation_dict[f2]
					print 'This one'
						
					related_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
					#print related_pairs
					#print '*************'
					for (f1_fe,f2_fe) in related_pairs:
							
							f1_name = ''
							f1_span = ''
							f2_name = ''
							f2_span = ''
							f1_span_temp = ''
							f2_span_temp = ''
							for m in range(0,len(f1_fes_list)):
								(f_name,f_span) = f1_fes_list[m]
								if f_name == f1_fe:
									f1_name = f_name
									f1_span = f_span
									idx1 = m
									break
							for n in range(0,len(f2_fes_list)):
								(f_name,f_span) = f2_fes_list[n]
								if f_name == f2_fe:
									f2_name = f_name
									f2_span = f_span
									idx2 = n
									break
							if f1_span != '' and f1_span == '-1_-1' and f2_span != '-1_-1' and f2_span != '':
								'''print 'Before Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role to be Filled:'+str((f1_name,f2_span))
								#print '//////////////'
								print '''
								f1_fes_list[idx1] = (f1_name,f2_span)
								'''print 'After Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role Filled:'+str((f1_name,f2_span))
								#print '//////////////'
								print''' 
							elif f2_span != '' and f2_span == '-1_-1' and f1_span != '-1_-1' and f1_span != '':
								'''print 'Before Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role to be Filled:'+str((f2_name,f1_span))
								#print '++++++++++++++++'
								print'''
								f2_fes_list[idx2] = (f2_name,f1_span)
								'''print 'After Role Filling'
								print (f1,f1_fes_list)
								print
								print (f2,f2_fes_list)
								print '============='
								print 'Role Filled:'+str((f2_name,f1_span))
								#print '++++++++++++++++'
								print''' 
				frame_data_list[i] = (f1,t1,f1_fes_list)
				frame_data_list[j] = (f2,t2,f2_fes_list)
	'''print '******************'
	#print 'After'
	#print frame_data_list'''
	return frame_data_list

def build_juliette_database_dict():
	continuation_relation_dict = {}
	#relation_file =  open('../data/v2relation-continuation.txt').readlines()
	relation_file =  open('../data/v2relation-full.txt').readlines()
	for l in relation_file[0:]:
		clean_line = l.rstrip()
		#print clean_line
		v1 = ''.join(clean_line.split('\t')[0])
		if len(v1.split('+')) > 1:
			v1 = v1.split('+')[1].lstrip(' ')
			
		v2 = ''.join(clean_line.split('\t')[1].lstrip(' '))
		if len(v2.split('+')) > 1:
			v2 = v2.split('+')[1].lstrip(' ')
		r = ''.join(clean_line.split('\t')[2].lstrip(' '))
		#print (v1,v2,r)
		continuation_relation_dict[(v1,v2)] = r
	return continuation_relation_dict

def any_relation_stats():
	stemmer = PorterStemmer()
	import sqlite3
	conn = sqlite3.connect('../../data/v2r_eng_3')
	cur = conn.cursor()
	
	total = 0
	#v2r_relation_full_dict = build_juliette_database_dict()
	all_doc_fn_dicts_list = read_all_docs_fn()
	#print len(all_doc_fn_dicts_list)
	for d in all_doc_fn_dicts_list:
		#parent_child_frame_dict = build_parent_child_frame_dict(d)
		#print d.keys()
		for (sen,sid) in d.keys():
			targets = []
			#print (sid)
			frame_and_fes_list = d[(sen,sid)]
			for (f,fes_list) in frame_and_fes_list:
				(fe,tar) = fes_list[0]
				targets.append(tar)
			#print targets
			for i in range(0,len(targets)):
				#for j in range(i+1,len(targets)):
				for j in range(0,len(targets)):
					#if j < len(targets):
						t1_lemma = stemmer.stem(targets[i].split('.')[0])
						t2_lemma = stemmer.stem(targets[j].split('.')[0])
						t1_pos = targets[i].split('.')[1]
						t2_pos = targets[j].split('.')[1]
						if t1_pos == 'v' and t2_pos == 'v':
							query = "SELECT verb1,verb2,relation FROM v2r WHERE verb1='"+t1_lemma+"' AND verb2='"+t2_lemma+"';"
							#print query
							cur.execute(query)
							result = cur.fetchall()
							if result != []:
								print sen
								print result
								total = total + 1
							elif i != j:
								total = total + 1
						
			
					
			#felements = [fes for (f,fes) in frame_and_fes_list]
	print 'Total='+str(total)
	
###################################
				
def lecsie_db():
	import sqlite3
	conn = sqlite3.connect('../../data/v2r_eng_3')
	c = conn.cursor()
	#cur = con.cursor()    
	#c.execute("SELECT name FROM sqlite_master WHERE type='table';")
	#c.execute("SELECT verb1,verb2,relation FROM v2r WHERE relation='continuation';")
	#c.execute("SELECT verb1,verb2,relation FROM v2r WHERE verb1='assure' and verb2='receive';")
	c.execute("SELECT verb1,verb2,relation FROM v2r;")
	#print c.description
	stemmer = PorterStemmer()
	for l in c.fetchall():
		clean_line = str(l).rstrip().lstrip('(').rstrip(')')
		#print clean_line
		v1 = str(''.join(clean_line.split(',')[0])).rstrip("'").lstrip("'")
		if len(v1.split('+')) > 1:
			v1 = v1.split('+')[1].lstrip(' ')
			
		v2 = str(''.join(clean_line.split(',')[1].lstrip(' ')))
		if len(v2.split('+')) > 1:
			v2 = v2.split('+')[1].lstrip(' ')
		r = str(''.join(clean_line.split(',')[2].lstrip(' ')))
		#print (str(stemmer.stem(v1)).rstrip("'").lstrip("'"),str(stemmer.stem(v2).rstrip("'").lstrip("'")),r)
		print str(stemmer.stem(v1)).rstrip("'").lstrip("'")+'\t'+str(stemmer.stem(v2).rstrip("'").lstrip("'"))+'\t'+r
	#print(c.fetchall())
									
#####################################							
def coreference_per_sentence_list():
	input_file = open('../evaluationData/test-sentences.txt.xml').read()
	coreference_rex = re.compile(r'<coreference>.*?</coreference>',re.S|re.M)
	sentenceNo_rex = re.compile(r'<sentence>.*?</sentence>',re.S|re.M)
	mention_rex = re.compile(r'<mention.*?</mention>',re.S|re.M)
	corefText_rex = re.compile(r'<text>.*?</text>',re.S|re.M)
	allCoreference_of_document = []
	
	for co in coreference_rex.findall(input_file):
		mentionAll = mention_rex.findall(co)
		allCoreference_of_sentence = []
		allCoreference_of_sentence_pairs = []
		for mention in mentionAll:
			sentenceNo = sentenceNo_rex.findall(mention)
			corefText = corefText_rex.findall(mention)
			allCoreference_of_sentence.append((sentenceNo[0],corefText[0]))
		for ((s1,t1),(s2,t2)) in itertools.combinations(allCoreference_of_sentence,2):
			if s1 == s2:
				allCoreference_of_document.append((s1.lstrip('<sentence>').rstrip('</sentence>'),str(t1[6:-7]),str(t2[6:-7])))
				#print ((s1,t1,t2))
	groups = [(key,list(group)) for key, group in itertools.groupby(sorted(allCoreference_of_document),lambda x: x[0])]
	coref_dict = {}
	for (s,g) in groups:
		coref_dict[s] = g
		#print (s,g)
	#print coref_dict
	return coref_dict
		
def data_for_evaluation_with_coreference_link():
	frame_relation_dicts = build_frDicts()
	d = build_parent_child_frame_dict(frame_relation_dicts[1])
	coreference_dict = coreference_per_sentence_list()
	#data = open('../evaluationData/without-f2f-constraints.txt')
	data = open('../evaluationData/gold-subframe.txt')
	test_sentences = open('../evaluationData/test-sentences.txt').readlines()
	sentenceNo = 1
	for l in data.readlines()[0:]:
		test_sentence = test_sentences[sentenceNo-1]
		if coreference_dict.has_key(str(sentenceNo)):
			#print sentenceNo
			coreferenceOfSentence = coreference_dict[str(sentenceNo)]
		
			sentenceNo = sentenceNo + 1
			frames_data = l.rstrip().split('\t')
			frame_data_list = []
			for frame in frames_data:
				frame_name = frame.split('$')[0]
				fes = frame.split('$')[1]
				fes_data_list = []
				for fe in fes.split('#'):
					fe_name = fe.split(':')[0]
					fe_span = fe.split(':')[1]
					fes_data_list.append((fe_name,fe_span))
				frame_data_list.append((frame_name,fes_data_list))
			#updated_list = role_fillings_coreference_gold(frame_data_list,d,coreferenceOfSentence,test_sentence)
			updated_list = role_fillings_coreference_gold_irrespective_of_f2f_relation(frame_data_list,d,coreferenceOfSentence,test_sentence)
		
			#print '\t'.join([(uframe+'$'+'#'.join([ufe_name+':'+ufe_span for (ufe_name,ufe_span) in ufes_list])) for
		else:
			sentenceNo = sentenceNo + 1	

def role_fillings_coreference(frame_data_list,frame_relation_dict,coreferenceOfSentence,test_sentence):
	'''print 'Full Frame List'
	print frame_data_list
	print '*********************'
	print 'Role Filling'
	print '''
	coref_pairs = [(c1,c2) for (s,c1,c2) in coreferenceOfSentence]
	#print coref_pairs
	for i in range(0,len(frame_data_list)):
		for j in range(i+1,len(frame_data_list)):
			if j < len(frame_data_list):
				(f1,f1_fes_list) = frame_data_list[i]
				(f2,f2_fes_list) = frame_data_list[j]
				f1_fes_list_text = [' '.join(test_sentence.split(' ')[int(s.split('_')[0]):int(s.split('_')[1])+1]) for (fe,s) in f1_fes_list if s != '-1_-1']
				f2_fes_list_text = [' '.join(test_sentence.split(' ')[int(s.split('_')[0]):int(s.split('_')[1])+1]) for (fe,s) in f2_fes_list if s != '-1_-1']
				#print f1_fes_list_text
				#print f2_fes_list_text
				if frame_relation_dict.has_key(f1) and frame_relation_dict.has_key(f2):
					(f1_parent,(f1_l1,f1_l2)) = frame_relation_dict[f1]
					(f2_parent,(f2_l1,f2_l2)) = frame_relation_dict[f2]
					#print (f1,f2)
					if f1_parent == f2_parent:
						#print 'yes'
						#related_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
						f2f_coref_pairs = []
						#print f1_fes_list_text
						#print f2_fes_list_text
						#print coref_pairs
						pairs = itertools.product(f1_fes_list_text,f2_fes_list_text)
						for (a,b) in pairs:
							#print (a,b)
							#print coref_pairs
							#print '=========='
							if (a,b) in coref_pairs:
								f2f_coref_pairs.append((a,b))
								print test_sentence
								print (f1,f2)
								print (a,b)
								print '======================'
						
						
	return ''

def role_fillings_coreference_gold(frame_data_list,frame_relation_dict,coreferenceOfSentence,test_sentence):
	'''print 'Full Frame List'
	print frame_data_list
	print '*********************'
	print 'Role Filling'
	print '''
	coref_pairs = [(c1,c2) for (s,c1,c2) in coreferenceOfSentence]
	#print coref_pairs
	for i in range(0,len(frame_data_list)):
		for j in range(i+1,len(frame_data_list)):
			if j < len(frame_data_list):
				(f1,f1_fes_list) = frame_data_list[i]
				(f2,f2_fes_list) = frame_data_list[j]
				f1_fes_list_text = [''.join(test_sentence[int(s.split('-')[0]):int(s.split('-')[1])+1]) for (fe,s) in f1_fes_list if s != '-1_-1']
				f2_fes_list_text = [''.join(test_sentence[int(s.split('-')[0]):int(s.split('-')[1])+1]) for (fe,s) in f2_fes_list if s != '-1_-1']
				#print f1_fes_list_text
				#print f2_fes_list_text
				if frame_relation_dict.has_key(f1) and frame_relation_dict.has_key(f2):
					(f1_parent,(f1_l1,f1_l2)) = frame_relation_dict[f1]
					(f2_parent,(f2_l1,f2_l2)) = frame_relation_dict[f2]
					#print (f1,f2)
					if f1_parent == f2_parent:
						#print 'yes'
						#related_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
						f2f_coref_pairs = []
						#print f1_fes_list_text
						#print f2_fes_list_text
						#print coref_pairs
						pairs = itertools.product(f1_fes_list_text,f2_fes_list_text)
						for (a,b) in pairs:
							#print (a,b)
							#print coref_pairs
							#print '=========='
							if (a,b) in coref_pairs:
								f2f_coref_pairs.append((a,b))
								print test_sentence
								print (f1,f2)
								print (a,b)
								print '======================'
						
						
	return ''
def role_fillings_coreference_gold_irrespective_of_f2f_relation(frame_data_list,frame_relation_dict,coreferenceOfSentence,test_sentence):
	
	coref_pairs = [(c1,c2) for (s,c1,c2) in coreferenceOfSentence]
	#print coref_pairs
	for i in range(0,len(frame_data_list)):
		for j in range(i+1,len(frame_data_list)):
			if j < len(frame_data_list):
				(f1,f1_fes_list) = frame_data_list[i]
				(f2,f2_fes_list) = frame_data_list[j]
				f1_fes_list_text = [(fe,''.join(test_sentence[int(s.split('-')[0]):int(s.split('-')[1])+1])) for (fe,s) in f1_fes_list if s != '-1_-1']
				f2_fes_list_text = [(fe,''.join(test_sentence[int(s.split('-')[0]):int(s.split('-')[1])+1])) for (fe,s) in f2_fes_list if s != '-1_-1']
				#print f1_fes_list_text
				#print f2_fes_list_text
				
				#if frame_relation_dict.has_key(f1) and frame_relation_dict.has_key(f2):
					#(f1_parent,(f1_l1,f1_l2)) = frame_relation_dict[f1]
					#(f2_parent,(f2_l1,f2_l2)) = frame_relation_dict[f2]
					#print (f1,f2)
					#if f1_parent == f2_parent:
						#print 'yes'
						#related_pairs = list(set(zip(f1_l1,f1_l2)).intersection(zip(f2_l1,f2_l2)))
				f2f_coref_pairs = []
						#print f1_fes_list_text
						#print f2_fes_list_text
						#print coref_pairs
				pairs = itertools.product(f1_fes_list_text,f2_fes_list_text)
				for ((fe1_p,a),(fe2_p,b)) in pairs:
							#print (a,b)
							#print coref_pairs
							#print '=========='
							if (a,b) in coref_pairs:
								f2f_coref_pairs.append((a,b))
								print test_sentence
								print ((f1,f1_fes_list_text),(f2,f2_fes_list_text))
								print ((fe1_p,a),(fe2_p,b))
								print '======================'
						
						
	return ''

#######################################
if __name__ == "__main__":
	import sys
	try:
		#lecsie_db() # Juliette's data base
		#data_for_evaluation()
		#data_for_evaluation_only_replacements()
		#data_for_evaluation_only_replacements_juliette()
		#any_relation_stats()
		data_for_evaluation_with_coreference_link()
		coreference_per_sentence_list()

	except:
		print >>sys.stderr, __doc__
		raise