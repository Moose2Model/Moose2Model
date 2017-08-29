tests
testDAllClassesOfPackage
	| eg el ep noPackage np |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	el := RWDiagramElement famixElement: class2.
	eg add: el.
	ep := RWDiagramElement famixElement: package1.
	self assert: (eg dAllClassesOfPackage: ep) size equals: 1.
	"After a refresh without replacing the FAMIXElement again, the element is not shown"
	eg elementList do: [ :e | e refresh ].
	self assert: (eg dAllClassesOfPackage: ep) size equals: 0.
	noPackage := RWDiagramNoPackage new.
	np := noPackage asRWDiagramElement.
	eg add: classNopackageRWDE. 
	self assert: (eg dAllClassesOfPackage: np) size equals: 1.