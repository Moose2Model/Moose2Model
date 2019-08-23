as yet unclassified
testSuppressWithChildrento
	| layout aTRShape aRTElement attributeList |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout moose2ModelName: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.
	layout suppressWithChildren: true to: class1RWDE.
	layout replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE.
	self assert: attributeList suppressWithChildren equals: true.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined