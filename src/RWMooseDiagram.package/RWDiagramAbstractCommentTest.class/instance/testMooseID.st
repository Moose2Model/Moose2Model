as yet unclassified
testMooseID
	| c |
	c := RWDiagramAbstractComment new.
	c mooseID: 1.
	self assert: c mooseID equals: 1