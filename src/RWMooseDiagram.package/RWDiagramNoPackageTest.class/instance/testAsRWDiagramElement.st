as yet unclassified
testAsRWDiagramElement
	| noPackage |
	noPackage := RWDiagramNoPackage new.
	self assert: noPackage asRWDiagramElement class equals: RWDiagramElement