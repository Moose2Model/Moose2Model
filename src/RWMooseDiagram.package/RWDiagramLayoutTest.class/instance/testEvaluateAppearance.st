as yet unclassified
testEvaluateAppearance
	| l aAC aAC1 |
	l := RWDiagramLayout new.
	l replaceMooseEntities: true.
	aAC := RWDiagramAppearanceChanger
		changeDeterminer:
			(RWDiagramACDStandard new
				includeMe: true
					usedByLayers: 1
					usingLayers: 1
					ofElement: methodI0RWDE ;
				yourself)
		changeType: RWDiagramACTHighlight new.
	l addAppearanceChanger: aAC to: methodI0RWDE.
	l evaluateAppearance.
	l replaceMooseEntities: true.
	self assert: (l readAttributesFromFAMIXElement: methodI0RWDE) appearance highlight equals: true.
	aAC1 := RWDiagramAppearanceChanger
		changeDeterminer:
			(RWDiagramACDStandard new
				includeMe: true
					usedByLayers: 1
					usingLayers: 1
					ofElement: methodI0RWDE;
				yourself)
		changeType: RWDiagramACTSuppressOthers new.	
	l addAppearanceChanger: aAC1 to: methodI0RWDE.
	l evaluateAppearance.
	self assert: l suppressOthersActive equals: true.
	l replaceMooseEntities: true.
	self assert: (l readAttributesFromFAMIXElement: methodI0RWDE) appearance othersAreSuppressed equals: true.	
	l replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined	