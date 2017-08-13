connections
connectedTo: aRWDiagramElement
	connectedTo ifNil: [ connectedTo := Set new ].
	connectedTo add: aRWDiagramElement