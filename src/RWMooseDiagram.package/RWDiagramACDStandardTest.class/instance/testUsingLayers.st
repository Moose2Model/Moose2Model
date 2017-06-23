as yet unclassified
testUsingLayers
	| acd |
	acd := RWDiagramACDStandard new.
	acd
		includeMe: true
			usedByLayers: 1
			usingLayers: 2
			ofElement: methodI0RWDE.
			self assert: acd usingLayers equals: 2