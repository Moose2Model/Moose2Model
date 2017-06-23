as yet unclassified
testDAllModelPackages
	| eg el |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	self assert: eg elementList size equals: 1.
	self assert: eg dAllModelPackages size equals: 1