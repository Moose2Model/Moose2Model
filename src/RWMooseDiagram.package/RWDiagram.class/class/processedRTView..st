processedView
processedRTView: aRTView
<RWDiaEdit_15>
	| l |
	"Set the processed View manually"
	l := RWDiagramEditor uniqueInstance currentLayout .
	l processedRTView: aRTView