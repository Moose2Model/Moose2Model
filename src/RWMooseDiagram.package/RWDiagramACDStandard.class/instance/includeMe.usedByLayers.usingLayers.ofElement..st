accessing
includeMe: aBoolean usedByLayers: aUsedByLayers usingLayers: aUsingLayers ofElement: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	includeMe := aBoolean.
	usedByLayers := aUsedByLayers.
	usingLayers := aUsingLayers.
	ofElement := aRWDiagramElement