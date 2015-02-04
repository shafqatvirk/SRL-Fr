def build():
	
	reqOut = open('../data/require.map','w')
	excOut = open('../data/exclusion.map','w')
	excData = open('../data/requirAndexclusionMap.txt').readlines()[0]
	for l in excData.split('},'):
		k = l.split('=')[0]
		data = l.split('=')[1]
		fdata = ''
		for d in data.split('>,<'):
			pair = d.lstrip('{').lstrip('<').rstrip('}').rstrip('>').split(',')
			a = pair[0]
			b = pair[1]
			fdata = fdata + '<"'+a+'","'+b.lstrip()+'">,'
		fdata = '{'+fdata.rstrip(',') + '}'
		excOut.write(k+'='+fdata+'\n')
	reqData = open('../data/requirAndexclusionMap.txt').readlines()[1]
	for l in reqData.split('},'):
		k = l.split('=')[0]
		data = l.split('=')[1]
		fdata = ''
		for d in data.split('>,<'):
			pair = d.lstrip('{').lstrip('<').rstrip('}').rstrip('>').split(',')
			a = pair[0]
			b = pair[1]
			fdata = fdata + '<"'+a+'","'+b.lstrip()+'">,'
		fdata = '{'+fdata.rstrip(',') + '}'
		reqOut.write(k+'='+fdata+'\n')
if __name__ == "__main__":
	import sys
	try:
		build()
	except:
		print >>sys.stderr, __doc__
		raise