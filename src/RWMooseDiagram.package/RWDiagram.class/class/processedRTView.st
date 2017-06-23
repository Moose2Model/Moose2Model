processedView
processedRTView
<RWDiaEdit_16>
	| l |
	"Returns the informations on the processed view"
	l := RWDiagramEditor uniqueInstance currentLayout .
	^ l processedRTView