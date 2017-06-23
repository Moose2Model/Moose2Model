as yet unclassified
adjustBy: aRWDiagramElement forChangeDeterminer: aRWDiagramAppearanceChangeDeterminer
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	refersToElement := aRWDiagramAppearanceChangeDeterminer ofElement.
	refersToLayer := aRWDiagramAppearanceChangeDeterminer layerOfElement: aRWDiagramElement