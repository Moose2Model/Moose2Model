as yet unclassified
testSuppressWithChildren
	| a |
	a := RWDiagramAttributeList new.
	self assert: a suppressWithChildren equals: false.
	a := RWDiagramAttributeList new suppressWithChildren: true.
	self assert: a suppressWithChildren equals: true