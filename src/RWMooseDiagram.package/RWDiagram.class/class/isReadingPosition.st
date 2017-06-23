adaptNewDiagram
isReadingPosition
	| e |
	<RWDiaEdit_27>
	"Display whether positions will be read when a new diagram is drawn"
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings isReadingPosition asString.
	^ e settings isReadingPosition