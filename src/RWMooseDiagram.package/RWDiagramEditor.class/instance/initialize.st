initialization
initialize
	super initialize.
	globalElementGroup := RWDiagramElementGroup new.
	currentLayoutName := 'First'.
	currentLayout := RWDiagramLayout new.
	currentLayout moose2ModelName: currentLayoutName.
	layouts := Dictionary new.
	settings := RWDiagramSettings new