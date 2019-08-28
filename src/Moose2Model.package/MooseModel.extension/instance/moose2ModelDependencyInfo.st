*Moose2Model
moose2ModelDependencyInfo
	<menuItem: 'Display with formatting info' category: 'Moose2Model'>
	|frontend|
	self
		inform:
			'Elements without appearance changers will be hightlighted. Use to find out where a statement like "RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self." is needed.'.
	RWDiagramEditor uniqueInstance currentLayout mooseID
		ifNotNil: [ RWDiagramEditor uniqueInstance currentLayout mooseID = self mooseID
				ifFalse: [ self inform: 'Model is changed. Read again from file, to see adaptions'. ^self ] ].
	RWDiagramEditor uniqueInstance settings displayFormatter: true.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses .
	frontend := self allClasses generateMoose2ModelDiagramOfMooseModel: self.
	^frontend "Frontend instance is needed in tests"