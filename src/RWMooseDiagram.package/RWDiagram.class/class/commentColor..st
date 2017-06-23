commenting
commentColor: aColor
	| e |
	<RWDiaEdit_11>
	"Set the general color of comments (Use the color transparent to have no color)"
	e := RWDiagramEditor uniqueInstance.
	e currentLayout commentColor: aColor