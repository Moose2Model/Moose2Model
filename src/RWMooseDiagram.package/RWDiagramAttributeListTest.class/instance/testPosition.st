as yet unclassified
testPosition
	| a |
	a := RWDiagramAttributeList new.
	a position: 10 @ 10.
	self assert: a position point equals: 10 @ 10