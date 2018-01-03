appearanceTermporary
removeTemporaryOfLayout: aRWDiagramLayout
	<RWDiaEdit_1>
	"Delete all temporary appearances"
   aRWDiagramLayout removeTemporary.

	"Now change the elements of the current layout"
	aRWDiagramLayout
		resetAppearance;
		evaluateAppearance;
		actualizeTemporaryAppearacenceInView: aRWDiagramLayout processedRTView