tests
testGridY
	"comment stating purpose of message"

	| s |
	s := RWDiagramSnapToGrid new.
	s gridY: 5.
	self assert: s gridY equals: 5