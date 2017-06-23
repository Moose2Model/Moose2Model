MethodUsage-calledFromMoose
readToRTView: b withEditor: rwEditor

	rwEditor settings isReading
		ifTrue: [ rwEditor readToRTView: b view messages: true ]