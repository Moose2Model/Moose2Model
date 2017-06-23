adaptNewDiagram
readPositions
	| e |
	<RWDiaEdit_25>
	"Activate reading of positions for a new diagram"
	e := RWDiagramEditor uniqueInstance.
	e settings isReadingPosition: true