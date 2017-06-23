adaptNewDiagram
inActive
	| e |
	<RWDiaEdit_7>
	"Inactivate the reading of layout attributes while drawing a new diagram"
	e := RWDiagramEditor uniqueInstance.
	e settings isReading: false