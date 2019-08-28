*Moose2Model
moose2ModelDependency
	<menuItem: 'Display diagram' category: 'Moose2Model'>
	|frontend|
	"Supports automatic tests"
	self inform: 'Use "Moose2Model with formatting info" to get a hint on how a diagram is generated'.
	RWDiagramEditor uniqueInstance currentLayout mooseID
		ifNotNil: [ RWDiagramEditor uniqueInstance currentLayout mooseID = self mooseID
				ifFalse: [ self inform: 'Model is changed. Read again from file, to see adaptions'. ^self ] ].
	RWDiagramEditor uniqueInstance settings displayFormatter: false.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self allClasses.
	frontend := self allClasses generateMoose2ModelDiagramOfMooseModel: self.
	^frontend "Frontend instance is needed in tests"