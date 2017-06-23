public-diagram
color: aColor FAMIXComponent: aRWDiagramElementOrMooseEntity view: aRTView
	| aRWDiagramElement |
	aRWDiagramElementOrMooseEntity class = RWDiagramElement
		ifTrue: [ aRWDiagramElement := aRWDiagramElementOrMooseEntity  ]
		ifFalse: [ aRWDiagramElement := RWDiagramElement famixElement: aRWDiagramElementOrMooseEntity ].
	aRTView elements
		do: [ :each | 
			aRWDiagramElement = each model
				ifTrue: [ each color: aColor ] ]