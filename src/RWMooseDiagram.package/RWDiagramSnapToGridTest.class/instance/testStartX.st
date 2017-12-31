tests
testStartX
	"comment stating purpose of message"

	| s  |
	s := RWDiagramSnapToGrid new.
	s startX: 5.
	self assert: s startX equals: 5.
