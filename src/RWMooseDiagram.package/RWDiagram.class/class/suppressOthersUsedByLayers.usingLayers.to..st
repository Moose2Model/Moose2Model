appearancePermanent
suppressOthersUsedByLayers: usedByLayers usingLayers: usingLayers to: aModelElement
	<RWDiaEdit_24>
	| l aRWDiagramElement |
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	"Specify which elements shall not be suppressed"
	l := RWDiagramEditor uniqueInstance currentLayout.
	l
		addAppearanceChanger:
			(RWDiagramAppearanceChanger
				changeDeterminer:
					(RWDiagramACDStandard new
						includeMe: true
						usedByLayers: usedByLayers
						usingLayers: usingLayers
						ofElement: aRWDiagramElement)
				changeType: RWDiagramACTSuppressOthers new)
		to: aRWDiagramElement