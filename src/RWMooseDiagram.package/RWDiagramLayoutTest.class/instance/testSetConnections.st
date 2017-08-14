tests
testSetConnections
	| layout |
	RWDiagramElement refresh.
	layout := RWDiagramLayout new.
	layout elementGroup add: class1RWDE.
	layout elementGroup add: class2RWDE.
	layout elementGroup add: method1RWDE.
	layout elementGroup add: method2RWDE.
	layout setConnections.
	layout elementGroup elementList
		do: [ :el | 
			el famixElement name = 'class1'
				ifTrue: [ self assert: el connectedTo size equals: 1 ].
			el famixElement name = 'class2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement name = 'method1'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement name = 'method2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ]  ]