public-diagram
evaluateAppearance
	"Sets the appearance for all elements
Determines whether at least a single element has suppress others active"

	suppressOthersActive := false.
	elementGroup elementList
		do: [ :each | 
			each famixElement
				ifNotNil: [ each attributeList attributeIsSpecified
						ifTrue: [ each attributeList appearanceChangerGroup appearanceChangers
								do: [ :ac | 
									ac changeType suppressOthers
										ifTrue: [ suppressOthersActive := true ].
									ac changeDeterminer element: each.
									ac changeDeterminer collectedElements do: [ :ce | self addAppearanceChangeType: (ac changeTypeAdjustedFor: ce) to: ce ] ] ] ] ]