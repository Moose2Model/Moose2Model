as yet unclassified
testAppearance
	| a |
	a := RWDiagramAttributeList new.
	self assert: a appearance appearenceIsSpecified equals: false.
	a appearance: RWDiagramAppearance new.
	self assert: a appearance class asString equals: 'RWDiagramAppearance'