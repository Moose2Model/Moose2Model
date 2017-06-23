adaptNewDiagram
lCPORepeat: anInteger
	| e |
	<RWDiaEdit_52>
	"Change the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	e settings lCPORepeat: anInteger