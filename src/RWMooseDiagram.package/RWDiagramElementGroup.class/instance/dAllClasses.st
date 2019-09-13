as yet unclassified
dAllClasses
	"Returns a collection of RWDiagramElement"

	| classes |
	classes := Set new.
	classes := elementList select: [ :each | each famixElement class asString = self aFAMIXClass ].
	^ classes