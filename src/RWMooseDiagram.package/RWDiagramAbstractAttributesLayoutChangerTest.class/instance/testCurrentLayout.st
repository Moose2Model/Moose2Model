as yet unclassified
testCurrentLayout
	| lc l |
	lc := RWDiagramAbstractAttributesLayoutChanger new.
	l := RWDiagramLayout new.
	l name: 'Test'.
	lc currentLayout: l.
	self assert: lc currentLayout name equals: 'Test'