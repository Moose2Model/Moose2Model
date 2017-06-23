appearance
removeAppearanceChangersFrom: aModelElement
	"Remove all appearance changers"
	
	    | aRWDiagramElement |
(aModelElement class inheritsFrom: MooseEntity) ifTrue:[aRWDiagramElement := aModelElement asRWDiagramElement: self]ifFalse:[aRWDiagramElement := aModelElement].

	self
		remember: [ :attributeList | 
			| a2 |
			attributeList attributeIsSpecified
				ifFalse: [ a2 := RWDiagramAttributeList new ]
				ifTrue: [ a2 := attributeList ].
			a2 removeAppearanceChangerGroup.
			a2 ]
		ofModel: aRWDiagramElement