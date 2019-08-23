tests
testConnectedFrom
	| e e2 |
	e := RWDiagramElement new.
	e famixElement: class1.
	self assert: e connectedFrom size equals: 0.
	e2 := RWDiagramElement new.
	e2 famixElement: class2.
	e connectedFrom: e2.
	self assert: e connectedFrom size equals: 1.
	e connectedFrom: e2.
	self assert: e connectedFrom size equals: 1.
	e connectedFrom do: [ :e3 | self assert: e3 famixElement moose2ModelName equals: 'class2' ].
	e refreshConnectedTo.
	self assert: e connectedFrom size equals: 0