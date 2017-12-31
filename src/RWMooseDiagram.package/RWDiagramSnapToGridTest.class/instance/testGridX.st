tests
testGridX
	"comment stating purpose of message"

	| s  |
	s := RWDiagramSnapToGrid new.
	s gridX: 5.
	self assert: s gridX equals: 5.
