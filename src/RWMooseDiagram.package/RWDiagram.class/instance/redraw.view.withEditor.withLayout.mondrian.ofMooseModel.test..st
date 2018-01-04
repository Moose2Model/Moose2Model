MethodUsage-calledFromMoose
redraw: aRWDiagramElementGroup view: e withEditor: rwEditor withLayout: aRWDiagramLayout mondrian: b ofMooseModel: aMooseModel test: isTest
	e clean.
	self
		methodUsage: aRWDiagramElementGroup
		withEditor: rwEditor
		withLayout: aRWDiagramLayout
		withMondrian: b
		ofMooseModel: aMooseModel 
		test: isTest.
	self readToRTView: b view withEditor: RWDiagramEditor uniqueInstance withLayout: aRWDiagramLayout.
	^ e signalUpdate