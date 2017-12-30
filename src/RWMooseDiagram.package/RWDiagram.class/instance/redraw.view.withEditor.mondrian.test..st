MethodUsage-calledFromMoose
redraw: aRWDiagramElementGroup view: e withEditor: rwEditor mondrian: b test: isTest
	e clean.
	self
		methodUsage: aRWDiagramElementGroup
		withEditor: rwEditor
		withMondrian: b
		test: isTest.
	self readToRTView: b view withEditor: RWDiagramEditor uniqueInstance.
	^ e signalUpdate