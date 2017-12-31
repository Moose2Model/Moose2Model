tests
testInitialize
	"comment stating purpose of message"

	| s  |
	s := RWDiagramSnapToGrid new.
	self assert: s startX equals: 0.
	self assert: s startY equals: 0.
	self assert: s gridX equals: 10.
	self assert: s gridY equals: 10.
