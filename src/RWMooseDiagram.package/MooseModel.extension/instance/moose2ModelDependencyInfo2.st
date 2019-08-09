*RWMooseDiagram
moose2ModelDependencyInfo2
"Backup of old logic, calls the inspector of the view"
	<menuItem: 'Display with formatting info 2' category: 'Moose2Model'>
	self
		inform:
			'Elements without appearance changers will be hightlighted. Use to find out where a statement like "RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self." is needed.'.
	RWDiagramEditor uniqueInstance currentLayout mooseID
		ifNotNil: [ RWDiagramEditor uniqueInstance currentLayout mooseID = self mooseID
				ifFalse: [ self inform: 'Model is changed. Read again from file, to see adaptions'. ^self ] ].
	RWDiagramEditor uniqueInstance settings displayFormatter: true.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses .
	self allClasses generateMoose2ModelDiagramOfMooseModel2: self