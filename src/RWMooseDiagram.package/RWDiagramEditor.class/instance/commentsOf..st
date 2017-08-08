reading
commentsOf: aRWDiagramElementCollection
	| col |
	"Returns a list of all local coments for a collections of FAMIX Elements. Sets moosesID in the Comment to be used in connecting both"
	self currentLayout replaceMooseEntities: true.
	col := OrderedCollection new.
	aRWDiagramElementCollection
		do: [ :each | 
			| attributeList |
			attributeList := self currentLayout readAttributesFromFAMIXElement: each.
			attributeList attributeIsSpecified
				ifTrue: [ attributeList comment exists
						ifTrue: [ attributeList comment mooseID: each uniqueKey.
							col add: attributeList comment ] ] ].
self currentLayout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
	^ col