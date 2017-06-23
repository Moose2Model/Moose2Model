adaptNewDiagram
read
	| e |
	<RWDiaEdit_6>
	"Activate reading of layout attributes for a new diagram"
	e := RWDiagramEditor uniqueInstance.
	e settings isReading: true