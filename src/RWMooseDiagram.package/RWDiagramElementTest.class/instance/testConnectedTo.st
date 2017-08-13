tests
testConnectedTo
	| e e2 |
	e := RWDiagramElement new.
	e famixElement: class1.
	self assert: e connectedTo size equals: 0.
	e2 := RWDiagramElement new.
	e2 famixElement: class2.
	e connectedTo: e2.
	self assert: e connectedTo size equals: 1.
	e connectedTo: e2.
	self assert: e connectedTo size equals: 1.
	e connectedTo do: [ :e3 | self assert: e3 famixElement name equals: 'class2' ].
	e refreshConnectedTo.
	self assert: e connectedTo size equals: 0