MethodUsage-calledFromMoose
popUpSmalltalkNotSupported
	RWDiagram automaticTestIsRunning
		ifTrue: [ "Do not ask user during Unit Test" ^ true ]
		ifFalse: [ ^ UIManager default
				question:
					'Displaying Smalltalk Image is not supported in Pharo 7 or higher. Use Moose on Pharo 5 or 6. Do you want to proceed?'
				title: 'Moose2Model' ]