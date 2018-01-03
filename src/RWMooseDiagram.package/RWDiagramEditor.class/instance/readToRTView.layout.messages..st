reading
readToRTView: aRTView layout: aRWDiagramLayout messages: aBoolean
	"Apply directy to an RTView
   apply selv view on a RTMondrian to get this view"

	<RWDiaEdit_14>
	<RWDiaEdit_49>
	self settings isReadingLayers
		ifTrue: [ | lcLayers |
			lcLayers := RWDiagramLCPLayers new.
			lcLayers
				currentLayout: aRWDiagramLayout;
				offsetY: self settings offsetY;
				readLayers: aRTView ]
		ifFalse: [ self settings isReadingPosition
				ifTrue: [ | lcp |
					lcp := RWDiagramLCPositions new.
					lcp
						currentLayout2: aRWDiagramLayout;
						readPositions: aRTView ] ].
	self settings preventOverlapping
		ifTrue: [ | lcPO |
			lcPO := RWDiagramLCPreventOverlapping new.
			lcPO
				space: self settings lCPOSpace;
				repeat: self settings lCPORepeat;
				maxChecks: self settings lCPOMaxChecks;
				preventOverlappings: aRTView messages: aBoolean ].
	aRWDiagramLayout processedRTView: aRTView