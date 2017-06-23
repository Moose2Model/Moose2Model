as yet unclassified
testDAllMethods
	| eg el |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	el := RWDiagramElement famixElement: class2.
	eg add: el.
	self assert: eg dAllMethods size equals: 10