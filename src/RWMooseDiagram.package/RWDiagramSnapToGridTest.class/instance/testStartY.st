tests
testStartY
	"comment stating purpose of message"

	| s  |
	s := RWDiagramSnapToGrid new.
	s startY: 5.
	self assert: s startY equals: 5.
