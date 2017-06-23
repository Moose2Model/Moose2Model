as yet unclassified
change: aRWDiagramAppearanceChangeDeterminer
	changeTypes ifNil: [ changeTypes := OrderedCollection new ].
	changeTypes add: aRWDiagramAppearanceChangeDeterminer