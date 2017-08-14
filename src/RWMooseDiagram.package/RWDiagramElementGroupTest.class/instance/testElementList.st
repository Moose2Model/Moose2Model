tests
testElementList
	| eg |
	eg := RWDiagramElementGroup new.
	eg apply: [ :e | e ] toAttribute: (RWDiagramElement famixElement: class1) replace: true "Check".
	self assert: eg elementList size equals: 1