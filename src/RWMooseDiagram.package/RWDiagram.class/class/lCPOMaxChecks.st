adaptNewDiagram
lCPOMaxChecks
	| e |
	<RWDiaEdit_60>
	"Display the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings lCPOMaxChecks asString.
	^ e settings lCPOMaxChecks