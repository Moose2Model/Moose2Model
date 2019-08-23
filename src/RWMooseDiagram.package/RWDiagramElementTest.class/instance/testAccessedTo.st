tests
testAccessedTo
	| e e2 |
	e := RWDiagramElement new.
	e famixElement: class1.
	self assert: e accessedTo size equals: 0.
	e2 := RWDiagramElement new.
	e2 famixElement: class2.
	e accessedTo: e2.
	self assert: e accessedTo size equals: 1.
	e accessedTo: e2.
	self assert: e accessedTo size equals: 1.
	e accessedTo do: [ :e3 | self assert: e3 famixElement moose2ModelName equals: 'class2' ].
	e refreshAccessedTo.
	self assert: e accessedTo size equals: 0