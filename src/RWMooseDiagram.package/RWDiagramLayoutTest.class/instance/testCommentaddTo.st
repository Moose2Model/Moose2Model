as yet unclassified
testCommentaddTo
	| layout aTRShape aRTElement attributeList |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout name: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.
	layout comment: 'A comment' to: class1RWDE.
	layout replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE.
	self assert: attributeList comment text equals: 'A comment'.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined