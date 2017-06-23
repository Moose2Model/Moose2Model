accessing
layerOfElement: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	^ collectedElementsByLayer at: aRWDiagramElement dMooseID