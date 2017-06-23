as yet unclassified
testSuppresWithChildren
	| a |
	a := RWDiagramAttributeList new suppressWithChildren: true.
	self assert: a suppressWithChildren equals: true