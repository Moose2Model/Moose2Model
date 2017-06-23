as yet unclassified
testAdd
	| noPackage |
	noPackage := RWDiagramNoPackage new.
	noPackage add: class1RWDE.
	self assert: noPackage classes size equals: 1.
	self assert: noPackage classes first class equals: FAMIXClass