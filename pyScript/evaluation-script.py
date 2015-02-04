import itertools
import re
import os
import itertools
from frameRelationFuns import *
def evaluate():
	test_sentences = open('../evaluationData/test-sentences-preceedes.txt').readlines()
	gold = open('../evaluationData/gold.txt').readlines()
	#withF2FConstraints = open('../evaluationData/with-f2f-constraints-precedes.txt').readlines()
	#withF2FConstraints = open('../evaluationData/without-f2f-constraints.txt').readlines()
	withF2FConstraints = open('../evaluationData/with-simple-rolefilling-precedes.txt').readlines()
	total_correct = 0
	total = 0
	if len(test_sentences) == len(gold) and len(test_sentences) == len(withF2FConstraints):
		for i in range(0,len(test_sentences)):
			(correct,total_tested) = evaluate_sentence(test_sentences[i],gold[i],withF2FConstraints[i])
			total_correct = total_correct + len(correct)
			total = total + total_tested
			
	print (total,total_correct)
def evaluate_sentence(sentence,gold,test):
	gold_dict = {}
	test_dict = {}
	temp_list = []
	duplicate_dict_gold = {}
	duplicate_dict_test = {}
	for g in gold.rstrip().split('\t'):
		frame = g.split('$')[0]
		fes = ''.join(g.split('$')[1:])
		fes_list = fes.split('#')
		temp = []
		for fe in fes_list:
			
			fe_name = fe.split(':')[0]
			fe_span = fe.split(':')[1]
			start = int(fe_span.split('-')[0])
			end = int(fe_span.split('-')[1])
			span_text = sentence[start:end+1]
			temp.append((fe_name,span_text))
		if gold_dict.has_key(frame):
			n = duplicate_dict_gold[frame]
			frame = frame+'-'+str(n+1)
			duplicate_dict_gold[frame] = n + 1
		else:
			duplicate_dict_gold[frame] = 0

		gold_dict[frame] = temp
	
	n = 1
	for t in test.rstrip().split('\t'):
		frame = t.split('$')[0]
		fes = ''.join(t.split('$')[1:])
		fes_list = fes.split('#')
		temp = []
		for fe in fes_list:
			
			fe_name = fe.split(':')[0]
			fe_span = fe.split(':')[1]
			start = int(fe_span.split('_')[0])
			end = int(fe_span.split('_')[1])
			if start != -1 and end != -1: 
				span_text = ' '.join(sentence.split(' ')[start:end+1])
				temp.append((fe_name,span_text))
		if test_dict.has_key(frame):
			m = duplicate_dict_test[frame]
			frame = frame+'-'+str(m+1)
			duplicate_dict_test[frame] = m + 1
		else:
			duplicate_dict_test[frame] = 0
		test_dict[frame] = temp
	result = []
	total_tested = 0
	print sentence
	print "*****************************************************"
	#print "%-25s%-25s%-25s%-100s%s"%("Frame","FE Gold","FE Test","Span Gold","Span Test")
	for gold_frame in gold_dict.keys():
		if test_dict.has_key(gold_frame):
			gold_fes = gold_dict[gold_frame]
			total_tested = total_tested + len(gold_fes)
			test_fes = test_dict[gold_frame]
			print 'Frame:  '+gold_frame
			print 'Gold:  '+str(gold_dict[gold_frame])
			print
			print 'Predicted:  '+str(test_dict[gold_frame])
			print "=============="
			for (fe,text) in gold_fes:
				for (fe_test,text_test) in test_fes:
					if fe == fe_test and text == text_test:
						#print (fe,fe_test)
						#print
						print "%-25s%-25s%-25s%-100s%s"%(gold_frame,fe,fe_test,text,text_test)
						print "**MATCH**"
						result.append('True')
					elif fe== fe_test:
						print "%-25s%-25s%-25s%-100s%s"%(gold_frame,fe,fe_test,text,text_test)
						print "**MISMATCH**"
			#print gold_fes
			#print test_fes
			#print
	#print "=============================================================================="
	
	#print test_dict
	#print gold_dict
	return (result,total_tested)
		

	
				
if __name__ == "__main__":
	import sys
	try:
		
		evaluate()

	except:
		print >>sys.stderr, __doc__
		raise