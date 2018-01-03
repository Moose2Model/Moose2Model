MethodUsage-calledFromMoose
readToRTView: b withEditor: rwEditor withLayout: aRWDiagramLayout
	" This is the main entry point to adapt the displayed elements"

	rwEditor settings isReading
		ifTrue: [ rwEditor readToRTView: b view layout: aRWDiagramLayout messages: true ]