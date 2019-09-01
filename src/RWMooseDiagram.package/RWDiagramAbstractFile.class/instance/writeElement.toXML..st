writing
writeElement: aRWDiagramElement toXML: writer
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	writer tag: #type with: aRWDiagramElement famixElement class asString.
	 ( self isFAMIXPackage: aRWDiagramElement famixElement )
		ifTrue: [ writer tag: #package with: aRWDiagramElement famixElement moose2ModelName asString ].
	 ( self isFAMIXClass: aRWDiagramElement famixElement )
		ifTrue: [ writer tag: #class with: aRWDiagramElement famixElement moose2ModelName asString ].
	 ( self isFAMIXMethod: aRWDiagramElement famixElement )
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType moose2ModelName asString;
				tag: #method with: aRWDiagramElement famixElement moose2ModelName asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope with: 'true'] ].
	 (self isFAMIXAttribute: aRWDiagramElement famixElement)
		ifTrue: [ writer
				tag: #class with: aRWDiagramElement famixElement parentType moose2ModelName asString;
				tag: #attribute with: aRWDiagramElement famixElement moose2ModelName asString.
				aRWDiagramElement famixElement hasClassScope ifTrue:[writer tag: #hasClassScope ]  ]