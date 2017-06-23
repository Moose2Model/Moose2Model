as yet unclassified
testUsesElements
	| acd elements |
	acd := RWDiagramACDStandard new.
	elements := acd usesElements: methodI0RWDE .
	self assert: (elements includes: methodI0P1RWDE ) equals: false.
	self assert: (elements includes: methodI0RWDE ) equals: false.
	self assert: (elements includes: methodI0M1RWDE ) equals: true.
	self assert: (elements includes: methodI0M2RWDE ) equals: false.
	self assert: (elements includes: attributeA0RWDE ) equals: true.
	elements := acd usesElements: methodI0M2RWDE .
	self assert: elements size equals: 0