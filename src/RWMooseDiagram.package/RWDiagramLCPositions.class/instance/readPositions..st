as yet unclassified
readPositions: aRTView
	| attributeList aRWDiagramElement log |
	log := false.
	log ifTrue:[Transcript cr; show: 'Read positions'; cr.].
	self currentLayout replaceMooseEntities: true.
	aRTView elements
		do: [ :element1 | 
			(element1 model class inheritsFrom: RWDiagramAbstractComment)
				ifTrue: [ (aRTView elements select: [ :element | element model class = RWDiagramElement and: [ element1 model uniqueKey = element model uniqueKey ] ])
						do: [ :each | 
							attributeList := self currentLayout readAttributesFromFAMIXElement: each model.
							attributeList
								ifNotNil: [ element1 model class = RWDiagramLocalComment
										ifTrue: [ attributeList comment positionSet
												ifTrue: [ element1 translateTo: attributeList comment position ] ] ] ] ].
			element1 model class = RWDiagramElement
				ifTrue: [ (element1 model famixElement class inheritsFrom: MooseEntity)
						ifTrue: [ aRWDiagramElement := RWDiagramElement famixElement: element1 model famixElement.
							attributeList := self currentLayout readAttributesFromFAMIXElement: aRWDiagramElement.
							attributeList attributeIsSpecified
								ifTrue: [ attributeList position positionIsDetermined
										ifTrue: [ element1 translateTo: attributeList position point.
											log
												ifTrue: [ Transcript show: element1 model asString, ' to ',attributeList position point x asString, '@',attributeList position point y asString; cr  ] ] ] ] ] ].
	self currentLayout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined