*RWMooseDiagram
moose2ModelDependencyInfo
	<menuItem: 'Display with formatting info' category: 'Moose2Model'>
	self
		inform:
			'Elements without appearance changers will be hightlighted. Use to find out where a statement like "RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self." is needed.'.
	RWDiagramEditor uniqueInstance settings displayFormatter: true.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses .
	self allClasses  generateMoose2ModelDiagram