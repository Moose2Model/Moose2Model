as yet unclassified
dIDependOn
	"Returns a set of RWDiagramElement an element depends on"

	| famixElements out |
	 (self isFAMIXMethod: self famixElement)
		ifTrue: [ famixElements := self famixElement invokedMethods storage union: (self famixElement queryOutgoingAccesses opposites asSet select: #isAttribute). out := self asRWDiagramElements: famixElements ].
	( self isFAMIXAttribute: self famixElement )
		ifTrue: [ famixElements := self famixElement accessingMethods. out := self asRWDiagramElements: famixElements ].
	out ifNil:[out := Set new].
	^ out