as yet unclassified
= aRWDiagramElement

	self class = aRWDiagramElement class
		ifFalse: [ ^ false ].
	^ self uniqueKey = aRWDiagramElement uniqueKey