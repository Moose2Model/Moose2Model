*RWMooseDiagram
viewRWDiagramDependencyInfo
	<menuItem: 'Moose2Model with formatting info' category: 'Visualize'>
	self inform: 'Elements without appearance changers will be hightlighted. Use to find out where a statement like "RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self." is needed.'.
	RWDiagramEditor uniqueInstance settings displayFormatter: true.
	self generateMoose2ModelDiagram