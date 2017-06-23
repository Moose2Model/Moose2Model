as yet unclassified
testUsedByElements
	| acd elements |
	acd := RWDiagramACDStandard new.
	elements := acd usedByElements: methodI0RWDE .
	self assert: (elements includes: methodI0P2RWDE ) equals: false.
	self assert: (elements includes: methodI0P1RWDE ) equals: true.
	self assert: (elements includes: methodI0RWDE ) equals: false.
	self assert: (elements includes: methodI0M1RWDE ) equals: false.
	self assert: (elements includes: attributeA0RWDE ) equals: true.
	elements := acd usedByElements: methodI0P2RWDE .
	self assert: elements size equals: 0