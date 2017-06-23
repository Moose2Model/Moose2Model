as yet unclassified
testIncludeMeUsedByLayersUsingLayersOfElement
	| acd collected |
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: true
			usedByLayers: 0
			usingLayers: 0
			ofElement: methodI0RWDE;
		collectedElements.
	self assert: collected size equals: 1.
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: false
			usedByLayers: 0
			usingLayers: 0
			ofElement: methodI0RWDE;
		collectedElements.
	self assert: collected size equals: 0.
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: false
			usedByLayers: 2
			usingLayers: 2
			ofElement: methodI0RWDE;
		collectedElements.
	self assert: collected size equals: 7.
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: false
			usedByLayers: 1
			usingLayers: 0
			ofElement: methodI0RWDE ;
		collectedElements.
	self assert: (collected includes: methodI0P2RWDE) equals: false.
	self assert: (collected includes: methodI0P1RWDE) equals: true.
	self assert: (collected includes: methodI0RWDE ) equals: false.
	self assert: (collected includes: methodI0M1RWDE) equals: false.
	self assert: (collected includes: methodI0M2RWDE) equals: false.
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: true
			usedByLayers: 0
			usingLayers: 2
			ofElement: methodI0RWDE;
		collectedElements.
	self assert: (collected includes: methodI0P2RWDE) equals: false.
	self assert: (collected includes: methodI0P1RWDE) equals: false.
	self assert: (collected includes: methodI0RWDE) equals: true.
	self assert: (collected includes: methodI0M1RWDE) equals: true.
	self assert: (collected includes: methodI0M2RWDE) equals: true.
	acd := RWDiagramACDStandard new.
	collected := acd
		includeMe: true
			usedByLayers: 1
			usingLayers: 1
			ofElement: methodI0RWDE;
		collectedElements.
	self assert: (collected includes: methodI0P2RWDE) equals: false.
	self assert: (collected includes: methodI0P1RWDE) equals: true.
	self assert: (collected includes: methodI0RWDE) equals: true.
	self assert: (collected includes: methodI0M1RWDE) equals: true.
	self assert: (collected includes: methodI0M2RWDE) equals: false