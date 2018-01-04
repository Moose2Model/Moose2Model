tests
testMooseID
	| layout |
	layout := RWDiagramLayout new.
	self assert: layout mooseID equals: nil.
	layout mooseID: 1.
	self assert: layout mooseID equals: 1