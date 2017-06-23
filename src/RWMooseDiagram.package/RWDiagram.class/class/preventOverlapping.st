adaptNewDiagram
preventOverlapping
	| e |
	<RWDiaEdit_51>
	e := RWDiagramEditor uniqueInstance.
	e settings preventOverlapping: true