as yet unclassified
testPoint
	| ap |
	ap := RWDiagramPosition new.
	ap point: 10 @ 10.
	self assert: ap positionIsDetermined equals: true.
	self assert: ap point equals: 10 @ 10