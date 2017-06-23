adaptNewDiagram
lCPOSpace: anInteger
	| e |
	<RWDiaEdit_54>
	"Change the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	e settings lCPOSpace: anInteger