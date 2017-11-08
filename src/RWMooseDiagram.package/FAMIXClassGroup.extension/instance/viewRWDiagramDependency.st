*RWMooseDiagram
viewRWDiagramDependency
	<menuItem: 'Moose2Model Software Exploration Tool' category: 'Visualize'>
	self inform: 'Use "Moose2Model with formatting info" to get a hint on how a diagram is generated'.
	RWDiagramEditor uniqueInstance settings displayFormatter: false.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self.
	self generateMoose2ModelDiagram