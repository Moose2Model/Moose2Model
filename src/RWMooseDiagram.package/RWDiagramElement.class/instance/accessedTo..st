connections
accessedTo: aRWDiagramElement
	accessedTo ifNil: [ accessedTo := Set new ].
	accessedTo add: aRWDiagramElement