adaptNewDiagram
lCPOSpace
	| e |
	<RWDiaEdit_55>
	"Display the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings lCPOSpace asString.
	^ e settings lCPOSpace 