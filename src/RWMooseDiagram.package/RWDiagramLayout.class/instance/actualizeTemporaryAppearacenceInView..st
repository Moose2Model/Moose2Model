as yet unclassified
actualizeTemporaryAppearacenceInView: aRTView
<duplicate_attr_color>
<duplicate_meth_color>
<duplicate_database_attr_color>
	aRTView elements
		do: [ :each | each model class = RWDiagramElement ifTrue:[
			each model famixElement class asString = self aFAMIXMethod
				ifTrue: [ (self highlight: each model)
						ifTrue: [ each color: self colorSchema methodHighLightedColor ]
						ifFalse: [ each color: self colorSchema methodColor ] ].
			each model famixElement class asString = self aFAMIXAttribute
				ifTrue: [ (each model famixElement parentType modifiers includes: 'DBTable')
						ifTrue: [ (self highlight: each model)
								ifTrue: [ each color: self colorSchema dataBaseAsAttributeHighLighteColor ]
								ifFalse: [ each color: self colorSchema dataBaseAsAttributeColor ] ]
						ifFalse: [ (self highlight: each model)
								ifTrue: [ each color: self colorSchema attributeHighLightedColor ]
								ifFalse: [ each color: self colorSchema attributeColor ] ] ] ] ]