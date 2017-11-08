adaptNewDiagram
rememberLastUsedDiagram
	| e |
	e := RWDiagramEditor uniqueInstance.
	RWDiagram rememberWrite: ( e lastUsedView view )