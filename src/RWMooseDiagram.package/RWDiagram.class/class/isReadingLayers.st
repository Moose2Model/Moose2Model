adaptNewDiagram
isReadingLayers
	| e |
	e := RWDiagramEditor uniqueInstance.
	self inform: e settings isReadingLayers asString.
	^ e settings isReadingLayers