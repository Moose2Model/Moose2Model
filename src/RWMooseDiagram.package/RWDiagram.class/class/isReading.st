adaptNewDiagram
isReading
	| e |
	<RWDiaEdit_8>
	"Display whether layout attributes will be read when a new diagram is drawn"
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings isReading asString.
	^ e settings isReading