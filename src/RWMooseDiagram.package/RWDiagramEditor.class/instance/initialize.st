initialization
initialize
	super initialize.
	globalElementGroup := RWDiagramElementGroup new.
	currentLayoutName := 'First'.
	currentLayout := RWDiagramLayout new.
	currentLayout name: currentLayoutName.
	layouts := Dictionary new.
	settings := RWDiagramSettings new