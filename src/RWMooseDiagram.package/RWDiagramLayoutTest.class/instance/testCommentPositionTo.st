as yet unclassified
testCommentPositionTo
	| layout aTRShape aRTElement attributeList |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout moose2ModelName: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.
	layout comment: 'A comment' to: class1RWDE.
	layout replaceMooseEntities: true.
	(layout readAttributesFromFAMIXElement: class1RWDE) comment position: 10 @ 20.
	layout replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE.
	self assert: attributeList comment position equals: 10 @ 20.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined