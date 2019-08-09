*RWMooseDiagram
moose2ModelDependency2
"Backup of old logic, calls the inspector of the view"
	<menuItem: 'Display diagram 2' category: 'Moose2Model'>
	self inform: 'Use "Moose2Model with formatting info" to get a hint on how a diagram is generated'.
	RWDiagramEditor uniqueInstance currentLayout mooseID
		ifNotNil: [ RWDiagramEditor uniqueInstance currentLayout mooseID = self mooseID
				ifFalse: [ self inform: 'Model is changed. Read again from file, to see adaptions'. ^self ] ].
	RWDiagramEditor uniqueInstance settings displayFormatter: false.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses.
	self allClasses generateMoose2ModelDiagramOfMooseModel2: self