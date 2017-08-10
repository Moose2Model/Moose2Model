tests
testDAllMethods
	| eg el |
	eg := RWDiagramElementGroup new.
	el := RWDiagramElement famixElement: class1.
	eg add: el.
	el := RWDiagramElement famixElement: class2.
	eg add: el.
	self assert: eg dAllMethods size equals: 10.
	"After a refresh without replacing the FAMIXElement again, the element is not shown"
	eg elementList do: [ :e | e refresh ].
	self assert: eg dAllMethods size equals: 0