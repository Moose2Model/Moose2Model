public-diagram
classNotToBeShown: aRWDiagramElementOrMooseEntity
| aMooseEntity |
aRWDiagramElementOrMooseEntity class = RWDiagramElement ifTrue:[aMooseEntity := aRWDiagramElementOrMooseEntity famixElement]ifFalse:[aMooseEntity := aRWDiagramElementOrMooseEntity].
	aMooseEntity methods
		do: [ :m | 
			(self othersAreSuppressed: m) 
				ifTrue: [ ^ false ] ].
	aMooseEntity attributes
		do: [ :m | 
			(self othersAreSuppressed: m) 
				ifTrue: [ ^ false ] ].
	^ true