as yet unclassified
testPosition
	| co |
	co := RWDiagramPositionableComment new.
	self assert: co positionSet equals: false.
	self assert: co position equals: nil.
	co position: 10 @ 10.
	self assert: co position equals: 10 @ 10.
	self assert: co positionSet equals: true