*RWMooseDiagram
viewRWDiagramDependency
	<menuItem: 'RW Dependency graph' category: 'Visualize'>
	| diagram aRWDElementGroup view |
	diagram := RWDiagram new.
	aRWDElementGroup := RWDiagramElementGroup new.
	self
		do: [ :each | 
			| anFElement |
			anFElement := RWDiagramElement famixElement: each.
			aRWDElementGroup add: anFElement ].
	view := diagram methodUsage: aRWDElementGroup withEditor: RWDiagramEditor uniqueInstance test: false.
	view inspect.
	diagram readToRTView: view withEditor: RWDiagramEditor uniqueInstance