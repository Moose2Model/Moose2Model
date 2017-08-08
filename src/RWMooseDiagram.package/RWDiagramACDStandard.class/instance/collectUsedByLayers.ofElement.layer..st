private
collectUsedByLayers: aUsedByLayers ofElement: aRWDiagramElement layer: currentLayer
	| TempUsedByLayers |
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	(self usedByElements: aRWDiagramElement)
		do: [ :each | 
			| bef aft |
			bef := collectedElements size.
			collectedElements add: each.
			aft := collectedElements size.
			bef = aft
				ifFalse: [ collectedElementsByLayer at: each uniqueKey put: currentLayer ].
			TempUsedByLayers := aUsedByLayers - 1.
			TempUsedByLayers > 0
				ifTrue: [ self collectUsedByLayers: TempUsedByLayers ofElement: each layer: currentLayer + 1 ] ]