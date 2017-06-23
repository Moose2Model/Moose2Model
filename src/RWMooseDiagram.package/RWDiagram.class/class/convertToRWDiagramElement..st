appearancePermanent
convertToRWDiagramElement: aModelElement
	| aRWDiagramElement |
	aModelElement class = RWDiagramElement
		ifTrue: [ aRWDiagramElement := aModelElement ]
		ifFalse: [ aRWDiagramElement := RWDiagramElement famixElement: aModelElement ].
	^ aRWDiagramElement