tests
testSetConnections
	| eg |
	RWDiagramElement refresh.
	eg := RWDiagramElementGroup new.
	eg add: class1RWDE.
	eg add: class2RWDE.
	eg setConnections.
	eg elementList
		do: [ :el | 
			el famixElement moose2ModelName = 'class1'
				ifTrue: [ self assert: el connectedTo size equals: 1 ].
			el famixElement moose2ModelName = 'class2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement moose2ModelName = 'method1'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement moose2ModelName = 'method2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ]  ]