appearanceTermporary
highlightIncludingMe: includeMe usedByLayers: usedByLayers usingLayers: usingLayers to: aModelElement ofLayout: aRWDiagramLayout
	| aRWDiagramElement |
	<RWDiaEdit_17>
	"Specify which elements shall be highlighted"
	
	(aModelElement class inheritsFrom: MooseEntity) ifTrue:[aRWDiagramElement := aModelElement asRWDiagramElement: aRWDiagramLayout]ifFalse:[aRWDiagramElement := aModelElement].
	aRWDiagramLayout
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
	aRWDiagramLayout
		resetAppearance;
		evaluateAppearance;
		actualizeTemporaryAppearacenceInView: aRWDiagramLayout processedRTView