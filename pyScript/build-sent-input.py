import itertools
			
def buildSentenceFiles():
	sentStatsFile = open('../../SemaforParser/semafor-semantic-parser/release/temp/51136.input.fes')
	sentStat = []
	triggers = [] #!
	frames = []
	frameLines = []
	for l in sentStatsFile.readlines():
		sentStat.append(l.split('\t')[6].rstrip())
		triggers.append(l.split('\t')[3].rstrip()) #!
	groups = [list(g) for k, g in itertools.groupby(sentStat)]
	allSentFramesProbsFile = open('../data/output-before-joint-decoding.txt')
	lines = allSentFramesProbsFile.readlines()
	frameLines.append(lines[0])
	for l in lines[1:]:
		if l.split(' ')[0] == 'Frame:':
			frames.append(frameLines)
			frameLines = []
			frameLines.append(l)
		else:
			frameLines.append(l)
	frames.append(frameLines)
	a = 0
	b = 0
	print groups
	print sum([len(g) for g in groups])
	print len(frames)
	triggerOutPutFile = open('../triggersData/triggers.txt','a') #!
	for g in groups:
		triggersForSen = [] #!
		outPutFile = open('../sentData/sent-'+str(groups.index(g))+'.txt','w')
		
		b = b + len(g)
		for f in frames[a:b]:
			outPutFile.write(''.join(f))
		for t in triggers[a:b]: #!
			triggersForSen.append(t) #!
		triggerOutPutFile.write('sent-'+str(groups.index(g))+'\t'+'\t'.join(triggersForSen)+'\n') #!
		a = b
		
if __name__ == "__main__":
	import sys
	try:
		#buildModleFiles()
		buildSentenceFiles()
	except:
		print >>sys.stderr, __doc__
		raise