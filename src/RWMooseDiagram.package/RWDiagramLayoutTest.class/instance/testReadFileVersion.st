tests
testReadFileVersion
	| layout |
	layout := RWDiagramLayout new name: 'T1'.
	self assert: layout readFileVersion equals: ''.
	layout readFileVersion: 'v0.3.0'.
	self assert: layout readFileVersion equals: 'v0.3.0'