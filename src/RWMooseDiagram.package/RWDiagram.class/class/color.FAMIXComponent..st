processedView
color: aColor FAMIXComponent: aFAMIXComponent
	<RWDiaEdit_2>
	"change the color of an element in the diagram temporary"
	| l |
	l := RWDiagramEditor uniqueInstance currentLayout .
	l color: aColor FAMIXComponent: aFAMIXComponent view: l processedRTView