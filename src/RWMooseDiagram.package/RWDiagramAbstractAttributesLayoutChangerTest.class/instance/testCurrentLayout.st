as yet unclassified
testCurrentLayout
	| lc l |
	lc := RWDiagramAbstractAttributesLayoutChanger new.
	l := RWDiagramLayout new.
	l name: 'Test'.
	lc currentLayout2: l.
	self assert: lc currentLayout2 name equals: 'Test'