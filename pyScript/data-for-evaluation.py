import itertools
import re
import os
import itertools
from frameRelationFuns import *

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
	d = build_parent_child_frame_dict(frame_relation_dicts[7])
	julitte_dict = build_juliette_database_dict()
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
				
				#print (t1_lemma,t2_lemma)
				if (juliette_relation_dict.has_key((t1_lemma,t2_lemma)) or juliette_relation_dict.has_key((t2_lemma,t1_lemma))):
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
	relation_file_continuation =  open('../data/v2relation-full.txt').readlines()
	for l in relation_file_continuation[0:]:
		clean_line = l.rstrip().lstrip('(').rstrip(')')
		#print clean_line
		v1 = ''.join(clean_line.split(',')[0])
		if len(v1.split('+')) > 1:
			v1 = v1.split('+')[1].lstrip(' ')
			
		v2 = ''.join(clean_line.split(',')[1].lstrip(' '))
		if len(v2.split('+')) > 1:
			v2 = v2.split('+')[1].lstrip(' ')
		r = ''.join(clean_line.split(',')[2].lstrip(' '))
		#print (v1,v2,r)
		continuation_relation_dict[(v1,v2)] = r
	return continuation_relation_dict
###################################
				
def lecsie_db():
	import sqlite3
	conn = sqlite3.connect('../../data/v2r_eng_3')
	c = conn.cursor()
	#cur = con.cursor()    
	#c.execute("SELECT name FROM sqlite_master WHERE type='table';")
	#c.execute("SELECT verb1,verb2,relation FROM v2r WHERE relation='continuation';")
	c.execute("SELECT verb1,verb2,relation FROM v2r;")
	#print c.description
	for l in c.fetchall():
		clean_line = str(l).rstrip().lstrip('(').rstrip(')')
		#print clean_line
		v1 = ''.join(clean_line.split(',')[0][2:-1])
		if len(v1.split('+')) > 1:
			v1 = v1.split('+')[1].lstrip(' ')
			
		v2 = ''.join(clean_line.split(',')[1].lstrip(' ')[2:-1])
		if len(v2.split('+')) > 1:
			v2 = v2.split('+')[1].lstrip(' ')
		r = ''.join(clean_line.split(',')[2].lstrip(' ')[2:-1])
		print (v1,v2,r)
	#print(c.fetchall())
									
							
									
				
if __name__ == "__main__":
	import sys
	try:
		#lecsie_db() # Juliette's data base
		#data_for_evaluation()
		#data_for_evaluation_only_replacements()
		data_for_evaluation_only_replacements_juliette()
		

	except:
		print >>sys.stderr, __doc__
		raise