adaptNewDiagram
lCPOMaxChecks: anInteger
	| e |
	<RWDiaEdit_59>
	"Change the number of iterations for preventing overlapping"
	e := RWDiagramEditor uniqueInstance.
	e settings lCPOMaxChecks: anInteger