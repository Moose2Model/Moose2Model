public-diagram
highlight: aFAMIXElement
	| attributeList |
	self replaceMooseEntities: false.
	attributeList := self readAttributesFromFAMIXElement: aFAMIXElement.
	RWDiagramEditor uniqueInstance settings displayFormatter
		ifFalse: [ self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
			^ attributeList appearance highlight ]
		ifTrue: [ "Highlight elements without permanent appearance changers"
			(attributeList appearanceChangerGroup appearanceChangers select: [ :each | each changeType isTemporary not ]) isEmpty
				ifTrue: [ ^ false ]
				ifFalse: [ ^ true ] ]