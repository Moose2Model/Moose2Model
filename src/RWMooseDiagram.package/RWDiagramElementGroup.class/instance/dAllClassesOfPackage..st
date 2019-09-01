as yet unclassified
dAllClassesOfPackage: aRWDiagramElementTypePackage
	"Returns a collection of RWDiagramElement"

	| classes |
	classes := Set new.
	classes := elementList
		select: [ :each | 
			 ( self isFAMIXClass: each famixElement )
				and: [ each dParentPackage moose2ModelName asLowercase = aRWDiagramElementTypePackage famixElement moose2ModelName asLowercase or: [ each dParentPackage isNil and: [ aRWDiagramElementTypePackage isNoPackage ] ] ] ].
	^ classes