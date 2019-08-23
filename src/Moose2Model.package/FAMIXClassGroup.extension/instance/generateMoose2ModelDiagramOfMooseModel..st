*Moose2Model
generateMoose2ModelDiagramOfMooseModel: aMooseModel
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
		ifNotNil: [ 
			|frontend|
			frontend := M2MFrontend new.
			frontend rtView: view mooseModel: aMooseModel.
			frontend openWithSpec.
			diagram
				readToRTView: view
				withEditor: RWDiagramEditor uniqueInstance
				withLayout: RWDiagramEditor uniqueInstance currentLayout.
				    e := RWDiagramEditor uniqueInstance.
				    e lastUsedView: view ]