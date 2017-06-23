as yet unclassified
testSuppressWithChildren
	| ga al |
	ga := RWDiagramUndeterminedAttributeList new.
	self assert: ga suppressWithChildren equals: false.
	al := ga suppressWithChildren: false.
	self assert: al class equals: RWDiagramAttributeList.
	self assert: al suppressWithChildren equals: false.
	al := ga suppressWithChildren: true.
	self assert: al suppressWithChildren equals: true
	
	
	