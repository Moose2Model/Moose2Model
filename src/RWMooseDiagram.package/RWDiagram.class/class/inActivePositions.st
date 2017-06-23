adaptNewDiagram
inActivePositions
	| e |
	<RWDiaEdit_26>
	"Inactivate the reading of positions while drawing a new diagram"
	e := RWDiagramEditor uniqueInstance.
	e settings isReadingPosition: false