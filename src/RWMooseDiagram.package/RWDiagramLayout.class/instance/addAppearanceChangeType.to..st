as yet unclassified
addAppearanceChangeType: aRWDiagramAppearanceChangeType to: aRWDiagramElement
	self
		remember: [ :attributeList | 
			| a2 |
			attributeList attributeIsSpecified
				ifFalse: [ a2 := RWDiagramAttributeList new ]
				ifTrue: [ a2 := attributeList ].
			a2 appearance appearenceIsSpecified
				ifFalse: [ a2 appearance: RWDiagramAppearance new ].
			a2 appearance change: aRWDiagramAppearanceChangeType.
			a2 ]
		ofModel: aRWDiagramElement