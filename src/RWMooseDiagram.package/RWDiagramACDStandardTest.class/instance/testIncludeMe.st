as yet unclassified
testIncludeMe
	| acd |
	acd := RWDiagramACDStandard new.
	acd
		includeMe: true
		usedByLayers: 1
		usingLayers: 2
		ofElement: methodI0RWDE.
	self assert: acd includeMe equals: true