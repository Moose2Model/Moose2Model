as yet unclassified
dDependOnMe
	"Returns a set of RWDiagramElement that depend on this element"

	| famixElements out |
	self famixElement class asString = self aFAMIXMethod
		ifTrue: [ famixElements := self famixElement invokingMethods storage union: (self famixElement queryOutgoingAccesses opposites asSet select: #isAttribute).
			out := self asRWDiagramElements: famixElements. ].

	self famixElement class asString = self aFAMIXAttribute
		ifTrue: [ famixElements := self famixElement accessingMethods.
			out := self asRWDiagramElements: famixElements. ].
	out ifNil:[out := Set new].
	^ out