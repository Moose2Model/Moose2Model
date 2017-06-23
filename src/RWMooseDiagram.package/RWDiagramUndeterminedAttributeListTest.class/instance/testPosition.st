as yet unclassified
testPosition
	| ga al |
	ga := RWDiagramUndeterminedAttributeList new.
	al := ga position: 10 @ 10.
	self assert: al class equals: RWDiagramAttributeList.
	self assert: al position point equals: 10 @ 10