reading
commentsOf: aRWDiagramElementCollection forLayout: aRWDiagramLayout
	| col |
	"Returns a list of all local coments for a collections of FAMIX Elements. Sets moosesID in the Comment to be used in connecting both"
	aRWDiagramLayout replaceMooseEntities: true.
	col := OrderedCollection new.
	aRWDiagramElementCollection
		do: [ :each | 
			| attributeList |
			attributeList := aRWDiagramLayout readAttributesFromFAMIXElement: each.
			attributeList attributeIsSpecified
				ifTrue: [ attributeList comment exists
						ifTrue: [ attributeList comment uniqueKeyOfCommentedElement: each uniqueKey.
							col add: attributeList comment ] ] ].
	aRWDiagramLayout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
	^ col