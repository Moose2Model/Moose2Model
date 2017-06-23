as yet unclassified
testRememberFromRTElement
	| layout aTRShape aRTElement aString |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout name: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.

	aRTElement model: class1RWDE .
	aTRShape element: aRTElement.
	layout remember: [ :attributeList | attributeList position: 10 @ 10 ] fromRTElement: aRTElement.
	layout  replaceMooseEntities: true.
	self
		assert: (layout readAttributesFromFAMIXElement: aTRShape element model) position point
		equals: 10 @ 10.
	aString := 'Text'.
	aRTElement model: aString.
	layout remember: [ :attributeList | attributeList position: 20 @ 20 ] fromRTElement: aRTElement.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) attributeIsSpecified
		equals: false.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined