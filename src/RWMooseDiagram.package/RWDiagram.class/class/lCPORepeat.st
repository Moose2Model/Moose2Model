adaptNewDiagram
lCPORepeat
	| e |
	<RWDiaEdit_53>
	"Display the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings lCPORepeat asString.
	^ e settings lCPORepeat