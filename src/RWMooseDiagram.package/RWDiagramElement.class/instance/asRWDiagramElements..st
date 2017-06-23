as yet unclassified
asRWDiagramElements: famixElements
	| out |
	out := Set new.
	famixElements
		do: [ :each | out add: (RWDiagramElement famixElement: each) ].
	^ out