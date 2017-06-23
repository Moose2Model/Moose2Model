appearance
addAppearanceChanger: aRWDiagramAppearanceChanger to: aModelElement
	self
		remember: [ :attributeList | 
			| a2 |
			attributeList attributeIsSpecified
				ifFalse: [ a2 := RWDiagramAttributeList new ]
				ifTrue: [ a2 := attributeList ].
			a2 appearanceChangerGroup addAppearentChanger: aRWDiagramAppearanceChanger.
			a2 ]
		ofModel: aModelElement