writing
writeElement: aRWDiagramElement toXML: writer
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	writer tag: #type with: aRWDiagramElement famixElement class asString.
	aRWDiagramElement famixElement class asString = self aFAMIXPackage
		ifTrue: [ writer tag: #package with: aRWDiagramElement famixElement name asString ].
	aRWDiagramElement famixElement class asString = self aFAMIXClass
		ifTrue: [ writer tag: #class with: aRWDiagramElement famixElement name asString ].
	aRWDiagramElement famixElement class asString = self aFAMIXMethod
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType name asString;
				tag: #method with: aRWDiagramElement famixElement name asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope with: 'true'] ].
	aRWDiagramElement famixElement class asString = self aFAMIXAttribute
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType name asString;
				tag: #attribute with: aRWDiagramElement famixElement name asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope ]  ]