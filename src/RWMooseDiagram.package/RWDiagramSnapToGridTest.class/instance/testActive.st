tests
testActive
	"comment stating purpose of message"

	| s |
	s := RWDiagramSnapToGrid new.
	self assert: s active equals: false.
	s active: true.
	self assert: s active equals: true.
	s active: false.
	self assert: s active equals: false