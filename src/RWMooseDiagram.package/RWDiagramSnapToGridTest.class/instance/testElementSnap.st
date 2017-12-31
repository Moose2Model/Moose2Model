tests
testElementSnap
	"comment stating purpose of message"

	| s |
	s := RWDiagramSnapToGrid new.
	s active: true.
	self assert: (s element: method1 snap: 1 @ 1) equals: 0 @ 0.
	s := RWDiagramSnapToGrid new.
	s active: true.
	self assert: (s element: var1 snap: 1 @ 1) equals: 0 @ 0.
	s := RWDiagramSnapToGrid new.
	s active: true.
	self assert: (s element: class1 snap: 1 @ 1) equals: 1 @ 1.
	s := RWDiagramSnapToGrid new.
	s active: true.
	self assert: (s element: package1 snap: 1 @ 1) equals: 1 @ 1