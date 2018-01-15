public
currentLayoutName: aString
	currentLayoutName := aString.
	"Workaround, make sure that current Layout is immediately set:"
	self currentLayout.
	RWDiagramSimpleGui getInstance redrawMe