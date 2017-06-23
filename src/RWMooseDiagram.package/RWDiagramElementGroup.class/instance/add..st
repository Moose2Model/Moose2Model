as yet unclassified
add: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	elementList at: aRWDiagramElement dMooseID put: aRWDiagramElement