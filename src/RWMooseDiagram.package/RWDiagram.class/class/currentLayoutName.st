layout
currentLayoutName
	| e |
	<RWDiaEdit_4>
	"Return the name of the current layout"
	e := RWDiagramEditor uniqueInstance.
	self inform: e currentLayoutName.
	^ e currentLayoutName