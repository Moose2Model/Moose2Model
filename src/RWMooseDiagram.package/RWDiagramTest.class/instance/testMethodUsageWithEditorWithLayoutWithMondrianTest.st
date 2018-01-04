tests
testMethodUsageWithEditorWithLayoutWithMondrianTest
	| classes diagram aRWDElementGroup view |
	classes := FAMIXClassGroup
		withAll:
			{class1.
			class2}.
	"Copy now part of FAMIXClassGroup>>viewRWDiagramDependency"
	diagram := RWDiagram new.
	aRWDElementGroup := RWDiagramElementGroup new.
	classes
		do: [ :each | 
			| anFElement |
			anFElement := RWDiagramElement famixElement: each.
			aRWDElementGroup add: anFElement ].
	view := diagram
		methodUsage: aRWDElementGroup
		withEditor: RWDiagramEditor new withLayout: nil withMondrian: nil ofMooseModel: MooseModel new test: true.