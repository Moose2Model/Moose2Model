appearancePermanent
suppressOthersUsedByLayers: usedByLayers usingLayers: usingLayers to: aModelElement ofLayout: aRWDiagramLayout
	<RWDiaEdit_24>
	| aRWDiagramElement |
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	"Specify which elements shall not be suppressed"
	aRWDiagramLayout
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