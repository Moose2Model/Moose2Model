as yet unclassified
testCommentto
	| layout aTRShape aRTElement attributeList |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout moose2ModelName: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.
	layout comment: 'A comment<br>second line' to: class1RWDE.
	layout  replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE.
	self assert: attributeList comment text equals: 'A comment', String crlf, 'second line'.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined