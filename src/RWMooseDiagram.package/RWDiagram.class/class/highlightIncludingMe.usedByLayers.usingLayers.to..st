appearanceTermporary
highlightIncludingMe: includeMe usedByLayers: usedByLayers usingLayers: usingLayers to: aModelElement
	| l aRWDiagramElement |
	<RWDiaEdit_17>
	"Specify which elements shall be highlighted"
	
	l := RWDiagramEditor uniqueInstance currentLayout.
	(aModelElement class inheritsFrom: MooseEntity) ifTrue:[aRWDiagramElement := aModelElement asRWDiagramElement: l]ifFalse:[aRWDiagramElement := aModelElement].
	l
		addAppearanceChanger:
			(RWDiagramAppearanceChanger
				changeDeterminer:
					(RWDiagramACDStandard new
						includeMe: includeMe
						usedByLayers: usedByLayers
						usingLayers: usingLayers
						ofElement: aRWDiagramElement)
				changeType: RWDiagramACTHighlight new)
		to: aRWDiagramElement.
	"Now change the elements of the current layout"
	l
		resetAppearance;
		evaluateAppearance;
		actualizeTemporaryAppearacenceInView: l processedRTView