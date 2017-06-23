appearanceTermporary
removeTemporary
	<RWDiaEdit_1>
	| l |
	"Delete all temporary appearances"
	l := RWDiagramEditor uniqueInstance currentLayout.
	l removeTemporary.

	"Now change the elements of the current layout"
	l
		resetAppearance;
		evaluateAppearance;
		actualizeTemporaryAppearacenceInView: l processedRTView