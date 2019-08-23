*Moose2Model
generateMoose2ModelDiagramOfMooseModel2: aMooseModel
"Backup of old logic, calls the inspector of the view"
	| aRWDElementGroup diagram view e |
	diagram := RWDiagram new.
	aRWDElementGroup := RWDiagramElementGroup new.
	self
		do: [ :each | 
			| anFElement |
			anFElement := RWDiagramElement famixElement: each.
			aRWDElementGroup add: anFElement ].
	view := diagram
		methodUsage: aRWDElementGroup
		withEditor: RWDiagramEditor uniqueInstance
		withLayout: nil
		 withMondrian: nil
		ofMooseModel: aMooseModel
		test: false.
	view
		ifNil: [ self inform: 'Generation of View aborted due to user request' ]
		ifNotNil: [ view inspect.
			diagram
				readToRTView: view
				withEditor: RWDiagramEditor uniqueInstance
				withLayout: RWDiagramEditor uniqueInstance currentLayout.
				    e := RWDiagramEditor uniqueInstance.
				    e lastUsedView: view ]