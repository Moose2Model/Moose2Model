public-diagram
replaceElementsFromFAMIXGroup: aRWDiagramElementGroup
	"Replaces and sets the elements of RWDiagramElementGroup with the most actual FAMIX Elements. This is required to evaluate invocations and accesses correctly"
self replaceMooseEntities: true.
	aRWDiagramElementGroup dAllModelPackages do: [ :pack | elementGroup apply: [ :e | e ] toAttribute: pack replace: self replaceMooseEntities "Check" ].
	aRWDiagramElementGroup dAllClasses
		do: [ :cl | 
			elementGroup apply: [ :e | e ] toAttribute: cl replace: true "Check".
			cl famixElement attributes do: [ :attr | elementGroup apply: [ :e | e ] toAttribute: (attr asRWDiagramElement: self) replace: self replaceMooseEntities "Check" ].
			cl famixElement methods do: [ :meth | elementGroup apply: [ :e | e ] toAttribute: (meth asRWDiagramElement: self) replace: self replaceMooseEntities "Check"  ] ].
		self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined