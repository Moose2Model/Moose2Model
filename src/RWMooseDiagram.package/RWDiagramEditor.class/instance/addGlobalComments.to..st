globalComments
addGlobalComments: aRWDiagramGlobalComment to: aRWDiagramElement
	self
		remember: [ :attributeList | 
			| a2 |
			aRWDiagramElement class = RWDiagramElement
				ifFalse: [ RWDiagramElementWrongTypeError signal ].
			attributeList attributeIsSpecified
				ifFalse: [ a2 := RWDiagramGlobalAttributeList new ]
				ifTrue: [ a2 := attributeList ].
			a2 addComment: aRWDiagramGlobalComment.
			a2 ]
		ofModel: aRWDiagramElement