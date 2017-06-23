initialization
initialize
super initialize.
	elementGroup ifNil: { elementGroup := RWDiagramElementGroup new }.
	replaceMooseEntities := RWDiagramLayout replaceMooseEntitiesUndefined.
	colorSchema := RWDiagramDefaultColorSchema new