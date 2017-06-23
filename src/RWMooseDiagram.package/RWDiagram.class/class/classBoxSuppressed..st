adaptNewDiagram
classBoxSuppressed: aBoolean
	<RWDiaEdit_34>
	| e |
	e := RWDiagramEditor uniqueInstance.
	"Suppress box and text for packages"
	e settings classBoxSuppressed: aBoolean