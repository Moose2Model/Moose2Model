writing
writeElement: aRWDiagramElement toXML: writer
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	writer tag: #type with: aRWDiagramElement famixElement class asString.
	aRWDiagramElement famixElement class asString = self aFAMIXPackage
		ifTrue: [ writer tag: #package with: aRWDiagramElement famixElement moose2ModelName asString ].
	aRWDiagramElement famixElement class asString = self aFAMIXClass
		ifTrue: [ writer tag: #class with: aRWDiagramElement famixElement moose2ModelName asString ].
	aRWDiagramElement famixElement class asString = self aFAMIXMethod
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType moose2ModelName asString;
				tag: #method with: aRWDiagramElement famixElement moose2ModelName asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope with: 'true'] ].
	aRWDiagramElement famixElement class asString = self aFAMIXAttribute
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType moose2ModelName asString;
				tag: #attribute with: aRWDiagramElement famixElement moose2ModelName asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope ]  ]