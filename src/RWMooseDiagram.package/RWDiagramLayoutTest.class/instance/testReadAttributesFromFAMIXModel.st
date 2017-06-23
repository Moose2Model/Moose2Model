as yet unclassified
testReadAttributesFromFAMIXModel
	| layout aTRShape aRTElement |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout name: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.
	aRTElement model: class1RWDE .
	aTRShape element: aRTElement.
	layout
		remember: [ :attributeList | attributeList position: 10 @ 10 ]
		fromRTElement: aRTElement.
	layout  replaceMooseEntities: true.
	self
		assert: (layout readAttributesFromFAMIXElement: aTRShape element model) position point
		equals: 10 @ 10.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined