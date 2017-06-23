layout
setCurrentLayout: aRTView
	| e |
	<RWDiaEdit_39>
	"Specify the Layout to be processed"
	e := RWDiagramEditor uniqueInstance.
	e setCurrentLayout: aRTView message: true