tests
testDAllModelPackages
	| eg el |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	self assert: eg elementList size equals: 1.
	self assert: eg dAllModelPackages size equals: 1.
	"After a refresh without replacing the FAMIXElement again, the element is not shown"
	eg elementList do: [ :e | e refresh ].
	self assert: eg dAllModelPackages size equals: 0.
    " Handle methods correctly"
    eg := RWDiagramElementGroup new.
    el := RWDiagramElement famixElement: method1.
    eg add: el.
    self assert: eg elementList size equals: 1.
    self assert: eg dAllModelPackages size equals: 0.
