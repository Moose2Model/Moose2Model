adaptNewDiagram
readLayers: aOffsetY
	<RWDiaEdit_48>
	| e |
	e := RWDiagramEditor uniqueInstance.
	e settings isReadingLayers: true.
	e settings offsetY: aOffsetY