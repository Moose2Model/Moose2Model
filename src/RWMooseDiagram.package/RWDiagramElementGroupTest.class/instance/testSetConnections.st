tests
testSetConnections
	| eg |
	RWDiagramElement refresh.
	eg := RWDiagramElementGroup new.
	eg add: class1RWDE.
	eg add: class2RWDE.
"	eg add: method1RWDE.
	eg add: method2RWDE."
	eg setConnections.
	eg elementList
		do: [ :el | 
			el famixElement name = 'class1'
				ifTrue: [ self assert: el connectedTo size equals: 1 ].
			el famixElement name = 'class2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement name = 'method1'
				ifTrue: [ self assert: el connectedTo size equals: 0 ] .
			el famixElement name = 'method2'
				ifTrue: [ self assert: el connectedTo size equals: 0 ]  ]