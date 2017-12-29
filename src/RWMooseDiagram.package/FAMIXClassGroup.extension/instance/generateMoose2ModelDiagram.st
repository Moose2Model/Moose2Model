*RWMooseDiagram
generateMoose2ModelDiagram
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
		 withMondrian: nil
		test: false.
	view
		ifNil: [ self inform: 'Generation of View aborted due to user request' ]
		ifNotNil: [ view inspect.
			diagram
				readToRTView: view
				withEditor: RWDiagramEditor uniqueInstance.
				    e := RWDiagramEditor uniqueInstance.
				    e lastUsedView: view ]