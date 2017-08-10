tests
testRefresh
	| layout el |
	layout := RWDiagramLayout new.
	el := RWDiagramElement famixElement: class1.
	layout elementGroup add: el.
	layout refresh.
	layout elementGroup elementList do: [ :e | self assert: e famixElement equals: nil ]