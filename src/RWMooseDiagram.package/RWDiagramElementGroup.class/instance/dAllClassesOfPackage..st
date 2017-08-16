as yet unclassified
dAllClassesOfPackage: aRWDiagramElementTypePackage
	"Returns a collection of RWDiagramElement"

	| classes |
	classes := Set new.
	classes := elementList select: [ :each | ( each famixElement class asString = self aFAMIXClass) and: [ each dParentPackage name =  aRWDiagramElementTypePackage famixElement name ] ].
	^ classes