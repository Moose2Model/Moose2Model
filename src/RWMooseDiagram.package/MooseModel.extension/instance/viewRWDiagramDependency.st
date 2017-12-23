*RWMooseDiagram
viewRWDiagramDependency
	<menuItem: 'Display Diagram' category: 'Moose2Model'>
	self inform: 'Use "Moose2Model with formatting info" to get a hint on how a diagram is generated'.
	RWDiagramEditor uniqueInstance settings displayFormatter: false.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses.
	self allClasses generateMoose2ModelDiagram