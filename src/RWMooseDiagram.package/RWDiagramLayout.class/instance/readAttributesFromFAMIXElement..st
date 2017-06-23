public-diagram
readAttributesFromFAMIXElement: aRWDiagramElementOrMooseEntity
	"From real view"

	"This is a private methods. If called for tests set
	layout replaceMooseEntities: true or false"

	| aRWDiagramElement |
	aRWDiagramElementOrMooseEntity class = RWDiagramElement
		ifTrue: [ aRWDiagramElement := aRWDiagramElementOrMooseEntity ]
		ifFalse: [ (aRWDiagramElementOrMooseEntity class inheritsFrom: MooseEntity)
				ifTrue: [ aRWDiagramElement := RWDiagramElement famixElement: aRWDiagramElementOrMooseEntity ] ].
	aRWDiagramElement class = RWDiagramElement
		ifTrue: [ ^ (elementGroup apply: [ :e | e ] toAttribute: aRWDiagramElement replace: self replaceMooseEntities) attributeList	"Check" ]
		ifFalse: [ ^ RWDiagramUndeterminedAttributeList new ]