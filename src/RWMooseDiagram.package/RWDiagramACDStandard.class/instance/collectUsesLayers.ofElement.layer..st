private
collectUsesLayers: aUsingLayers ofElement: aRWDiagramElement layer: currentLayer

	| tempUsingLayers |
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	(self usesElements: aRWDiagramElement)
		do: [ :each | 
			| bef aft |
			bef := collectedElements size.
			collectedElements add: each.
			aft := collectedElements size.
			bef = aft
				ifFalse: [ collectedElementsByLayer at: each dMooseID put: currentLayer ].
			tempUsingLayers := aUsingLayers - 1.
			tempUsingLayers > 0
				ifTrue:
					[ self collectUsesLayers: tempUsingLayers ofElement: each layer: currentLayer - 1 ] ]