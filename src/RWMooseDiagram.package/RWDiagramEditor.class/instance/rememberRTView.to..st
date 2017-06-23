remember
rememberRTView: aRTView to: aLayout
	<RWDiaEdit_35>
	aRTView elements
		do: [ :aRTElement | 
			(aRTElement model class = RWDiagramLocalComment)
				ifTrue: [ (aRTView elements
						select: [ :each | each model class = RWDiagramElement and: [ (each model famixElement class inheritsFrom: MooseEntity) and: [ each model famixElement mooseID = aRTElement model mooseID ] ] ])
						do: [ :each | 
							aLayout
								remember: [ :attributeList | 
									attributeList comment position: aRTElement position.
									attributeList ]
								fromRTElement: each ] ]
				ifFalse: [ aLayout remember: [ :attributeList | attributeList position: aRTElement position ] fromRTElement: aRTElement ] ]