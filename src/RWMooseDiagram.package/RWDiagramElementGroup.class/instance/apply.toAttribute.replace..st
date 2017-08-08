as yet unclassified
apply: aBlock toAttribute: aRWDiagramElementOrMooseEntity replace: isToBeReplaced
	"Applys the given block to the attribute list of a found or inserted element.
	The block has to return the attributeList."

	"The search is done using names not using the Moose ID"

	"Replace is true: Replaces the Moose Entity in RWDiagramElement with the Moose Entity used for the search. This is used, when the search is done with a real model. For instance when diagram data is stored."

	"Replace is false: Returns the Moose Entity that is already existing if it is found. This is done when the search is done while reading attributes. The real model has to remain untouched."

	"Returns the RWDiagramElement found"

	| aElement foundElement aMooseEntity |
	"Checks"
	isToBeReplaced = RWDiagramLayout replaceMooseEntitiesUndefined
		ifTrue: [ RWDiagramReplaceUndefined signal ].
	aRWDiagramElementOrMooseEntity class = RWDiagramElement
		ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity famixElement ]
		ifFalse: [ (aRWDiagramElementOrMooseEntity class inheritsFrom: MooseEntity)
				ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity ]
				ifFalse: [ aRWDiagramElementOrMooseEntity class = RWDiagramNoPackage
						ifTrue: [ aMooseEntity := aRWDiagramElementOrMooseEntity ]
						ifFalse: [ RWDiagramElementWrongTypeError signal ] ] ].
	"Read value"
	aElement := RWDiagramElement new.
	aElement famixElement: aMooseEntity.
	[ foundElement := elementList at: aElement uniqueKey.
	foundElement attributeList: (aBlock value: foundElement attributeList).
	(foundElement attributeList class inheritsFrom: RWDiagramAbstractAttributeList)
		ifFalse: [ RWDiagramError signal ].	"The Block aBlock has at the end always to return the attribute list itself"
	foundElement famixElement mooseID = aMooseEntity mooseID
		ifTrue: [  ]
		ifFalse: [ isToBeReplaced
				ifTrue: [ elementList removeKey: foundElement uniqueKey ifAbsent: [  ].
					foundElement famixElement: aMooseEntity.
					elementList at: foundElement uniqueKey put: foundElement ]
				ifFalse: [ elementList at: foundElement uniqueKey put: foundElement ] ].
	^ foundElement ]
		on: KeyNotFound
		do: [ "No existing RWDiagramElement is found, so insert a new one and apply the block"
			aElement := RWDiagramElement new.
			aElement famixElement: aMooseEntity.
			aElement elementIsStored
				ifTrue: [ aElement attributeList: (aBlock value: RWDiagramUndeterminedAttributeList new).
					elementList at: aElement uniqueKey put: aElement ].
			^ aElement ]