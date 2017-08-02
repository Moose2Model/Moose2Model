layout
currentLayoutName: aString
	<RWDiaEdit_3>
	| e |
	e := RWDiagramEditor uniqueInstance.
	"Specify the Layout to be processed"
	e currentLayoutName: aString.
	self inform: 'New layout: ' , aString , ' do not forget to call the method readFromPath'