MethodUsage-calledFromMoose
redraw: aRWDiagramElementGroup view: e withEditor: rwEditor withLayout: aRWDiagramLayout mondrian: b test: isTest
	e clean.
	self
		methodUsage: aRWDiagramElementGroup
		withEditor: rwEditor
		withLayout: aRWDiagramLayout
		withMondrian: b
		test: isTest.
	self readToRTView: b view withEditor: RWDiagramEditor uniqueInstance withLayout: aRWDiagramLayout.
	^ e signalUpdate