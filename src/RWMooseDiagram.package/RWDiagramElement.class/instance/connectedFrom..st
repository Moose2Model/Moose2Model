connections
connectedFrom: aRWDiagramElement
	connectedFrom ifNil: [ connectedFrom := Set new ].
	connectedFrom add: aRWDiagramElement