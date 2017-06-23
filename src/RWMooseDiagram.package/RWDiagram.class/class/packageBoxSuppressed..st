adaptNewDiagram
packageBoxSuppressed: aBoolean
	<RWDiaEdit_33>
	| e |
	e := RWDiagramEditor uniqueInstance.
	"Suppress box and text for packages"
	e settings packageBoxSuppressed: aBoolean