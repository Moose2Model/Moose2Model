as yet unclassified
testCurrentLayout
	| lc l |
	lc := RWDiagramAbstractAttributesLayoutChanger new.
	l := RWDiagramLayout new.
	l moose2ModelName: 'Test'.
	lc currentLayout2: l.
	self assert: lc currentLayout2 moose2ModelName equals: 'Test'