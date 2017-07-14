MethodUsage-calledFromMoose
readToRTView: b withEditor: rwEditor
	" This is the main entry point to adapt the displayed elements"

	rwEditor settings isReading
		ifTrue: [ rwEditor readToRTView: b view messages: true ]