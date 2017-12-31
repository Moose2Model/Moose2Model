reading
readToRTView: aRTView messages: aBoolean
	"Apply directy to an RTView
   apply selv view on a RTMondrian to get this view"

	<RWDiaEdit_14>
	<RWDiaEdit_49>
	self settings isReadingLayers
		ifTrue: [ | lcLayers |
			lcLayers := RWDiagramLCPLayers new.
			lcLayers
				currentLayout: self currentLayout;
				offsetY: self settings offsetY;
				readLayers: aRTView ]
		ifFalse: [ self settings isReadingPosition
				ifTrue: [ | lcp |
					lcp := RWDiagramLCPositions new.
					lcp
						currentLayout2: self currentLayout;
						readPositions: aRTView ] ].
	self settings preventOverlapping
		ifTrue: [ | lcPO |
			lcPO := RWDiagramLCPreventOverlapping new.
			lcPO
				space: self settings lCPOSpace;
				repeat: self settings lCPORepeat;
				maxChecks: self settings lCPOMaxChecks;
				preventOverlappings: aRTView messages: aBoolean ].
	self currentLayout processedRTView: aRTView