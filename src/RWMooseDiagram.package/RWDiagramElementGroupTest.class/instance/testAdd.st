as yet unclassified
testAdd
	| eg el |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	self assert: eg elementList size equals: 1