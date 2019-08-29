MethodUsage-calledFromMoose
popUpAllElementsDisplayed
	RWDiagram automaticTestIsRunning
		ifTrue: [ "Do not ask user during Unit Test" ^ true ]
		ifFalse: [ ^ UIManager default
				question: 'All elements are displayed, runtime can be long. Do you want to proceed?'
				title: 'Moose2Model' ]