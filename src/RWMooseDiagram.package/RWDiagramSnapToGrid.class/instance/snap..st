as yet unclassified
snap: aPoint
	| xRound yRound rounded |
	self active
		ifFalse: [ ^ aPoint ]
		ifTrue: [ history ifNil: [ history := Dictionary new ].
			xRound := startX + (aPoint x - startX roundTo: gridX).
			yRound := startY + (aPoint y - startY roundTo: gridY).
			rounded := xRound @ yRound.
			[ history at: rounded ifAbsent: false ] whileTrue: [ rounded := rounded + (1 @ 1) ].
			history at: rounded put: true ].
	^ rounded