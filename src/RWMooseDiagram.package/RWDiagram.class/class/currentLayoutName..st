layout
currentLayoutName: aString
	| e |
	<RWDiaEdit_3>
	"Specify the Layout to be processed"
	e := RWDiagramEditor uniqueInstance.
	e currentLayoutName: aString