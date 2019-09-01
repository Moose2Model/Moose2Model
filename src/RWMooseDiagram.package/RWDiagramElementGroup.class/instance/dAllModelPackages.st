as yet unclassified
dAllModelPackages
	"Returns a collection of RWDiagramElement"

	| packages noPackage |
	packages := Set new.
	noPackage := RWDiagramNoPackage new.
	elementList
		do: [ :each | 
			each famixElement
				ifNotNil: [ ( self isFAMIXClass: each famixElement )
						ifTrue: [ each dParentPackage
								ifNotNil: [ packages add: (each dParentPackage asRWDiagramElement: self) ]
								ifNil: [ noPackage add: each.
									packages add: noPackage asRWDiagramElement ] ] ] ].
	^ packages