accessing
includeMe: aBoolean usedByLayers: aUsedByLayers usingLayers: aUsingLayers ofElement: aRWDiagramElement
	"Define me when this Change Determiners is applied directly on an element"

	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	includeMe := aBoolean.
	usedByLayers := aUsedByLayers.
	usingLayers := aUsingLayers.
	ofElement := aRWDiagramElement