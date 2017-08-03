as yet unclassified
apply: aBlock toAttribute: aRWDiagramElementOrMooseEntity replace: isToBeReplaced
	"Applys the given block to the attribute list of a found or inserted element.
	The block has to return the attributeList."

	"The search is done using names not using the Moose ID"

	"Replace is true: Replaces the Moose Entity in RWDiagramElement with the Moose Entity used for the search. This is used, when the search is done with a real model. For instance when diagram data is stored."

	"Replace is false: Returns the Moose Entity that is already existing if it is found. This is done when the search is done while reading attributes. The real model has to remain untouched."

	"Returns the RWDiagramElement found"

	| aElement aMooseEntity |
	isToBeReplaced = RWDiagramLayout replaceMooseEntitiesUndefined
		ifTrue: [ RWDiagramReplaceUndefined signal ].
	aRWDiagramElementOrMooseEntity class = RWDiagramElement
		ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity famixElement ]
		ifFalse: [ (aRWDiagramElementOrMooseEntity class inheritsFrom: MooseEntity)
				ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity ]
				ifFalse: [ aRWDiagramElementOrMooseEntity class = RWDiagramNoPackage
						ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity ]
						ifFalse: [ RWDiagramElementWrongTypeError signal ] ] ].
	(elementList
		select: [ :each | 
			| found |
			found := false.
			"Now check whether the elements are equal, using type, name and parent name
			For hasClassScope this is to be checked also for attributes and models"
			aMooseEntity class = each famixElement class
				ifTrue: [ aMooseEntity name = each famixElement name
						ifTrue: [ each elementHandledWithParents
								ifFalse: [ found := true ]
								ifTrue: [ aMooseEntity parentType name = each famixElement parentType name
										ifTrue: [ (aMooseEntity class asString = self aFAMIXMethod or: [ aMooseEntity class asString = self aFAMIXMethod ])
												ifTrue: [ aMooseEntity hasClassScope = each famixElement hasClassScope
														ifTrue: [ found := true ] ]
												ifFalse: [ found := true ] ] ] ] ].
			found ])
		do: [ :each | 
			each attributeList: (aBlock value: each attributeList).
			(each attributeList class inheritsFrom: RWDiagramAbstractAttributeList)
				ifFalse: [ RWDiagramError signal ].	"The Block aBlock has at the end always to return the attribute list itself"
			each dMooseID = aMooseEntity mooseID
				ifTrue: [  ]
				ifFalse: [ isToBeReplaced
						ifTrue: [ elementList removeKey: each dMooseID ifAbsent: [  ].
							each famixElement: aMooseEntity.
							elementList at: aMooseEntity mooseID put: each ]
						ifFalse: [ elementList at: each dMooseID put: each ] ].
			^ each ].
	aElement := RWDiagramElement new.
	aElement famixElement: aMooseEntity.
	aElement elementIsStored
		ifTrue: [ aElement attributeList: (aBlock value: RWDiagramUndeterminedAttributeList new).
			elementList at: aElement dMooseID put: aElement ].
	^ aElement