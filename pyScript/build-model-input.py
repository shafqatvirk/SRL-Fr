import itertools
def buildModleFiles(sentFile):
	#print sentFile
	inputLines = open(sentFile).readlines()
	frames = []
	frameLines = []
	for l in inputLines[1:]:
		if l.split(' ')[0] == 'Frame:':
			frames.append(frameLines)
			frameLines = []
		else:
			frameLines.append(l)
	frames.append(frameLines)		
	#print len(frames)
	for i in range(0,len(frames)):
		outPutFile = open('../frameData/frame'+str(i)+'.txt','w')
		outSpans = open('../spanData/span'+str(i)+'.txt','w')
		for s in (frames[i])[1].rstrip().split(' '):
			#print s
			outSpans.write(' '.join(s.split('_'))+'\n')
		outSpans.close()
		for l in frames[i]:
			#print l[1]
			#print
			outPutFile.write(l)
			

		
if __name__ == "__main__":
	import sys
	try:
		buildModleFiles(sys.argv[1])

	except:
		print >>sys.stderr, __doc__
		raise