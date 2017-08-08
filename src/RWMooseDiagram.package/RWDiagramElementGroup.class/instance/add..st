as yet unclassified
add: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	elementList at: aRWDiagramElement uniqueKey put: aRWDiagramElement