reading
globalCommentsOf: aModelElementsCollection
	| col |
	"Returns a list of all global coments for a collections of FAMIX Elements. Sets moosesID in the Comment to be used in connecting both"
	col := OrderedCollection new.
	aModelElementsCollection
		do: [ :each | 
			| globalAttributeList |
			globalAttributeList := self readAttributesFromFAMIXElement: each.
			globalAttributeList attributeIsSpecified
				ifTrue: [ globalAttributeList comments
						do: [ :globComment | 
							globComment mooseID: each dMooseID.
							col add: globComment ] ] ].
	^ col