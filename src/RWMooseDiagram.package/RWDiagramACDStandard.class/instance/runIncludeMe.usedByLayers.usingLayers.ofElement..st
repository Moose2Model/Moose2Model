accessing
runIncludeMe: aBoolean usedByLayers: aUsedByLayers usingLayers: aUsingLayers ofElement: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
   collectedElementsByLayer ifNil: [ collectedElementsByLayer := Dictionary new ].
	aBoolean
		ifTrue: [ collectedElements add: aRWDiagramElement.
			collectedElementsByLayer at: aRWDiagramElement dMooseID put: 0 ].
	aUsedByLayers > 0
		ifTrue: [ self collectUsedByLayers: aUsedByLayers ofElement: aRWDiagramElement layer: 1 ].
	aUsingLayers > 0
		ifTrue: [ self collectUsesLayers: aUsingLayers ofElement: aRWDiagramElement layer: -1]