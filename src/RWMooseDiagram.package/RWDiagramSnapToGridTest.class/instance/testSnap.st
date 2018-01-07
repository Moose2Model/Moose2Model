tests
testSnap
	"comment stating purpose of message"

	| s |
	s := RWDiagramSnapToGrid new.
	s startX: 1.
	s startY: 2.
	s gridX: 20.
	s gridY: 30.
	s active: false.
	self assert: (s snap: 25 @ 35) equals: 25 @ 35.
	s active: true.
	self assert: (s snap: 25 @ 35) equals: 21 @ 32.
	"The logic to reposition elements that would be at the same position is currently not activated"
	"self assert: (s snap: 25 @ 35) equals: 22 @ 33."
	s reset.
	self assert: (s snap: 25 @ 35) equals: 21 @ 32.