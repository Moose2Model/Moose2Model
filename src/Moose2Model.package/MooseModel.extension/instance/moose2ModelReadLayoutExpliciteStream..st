*Moose2Model
moose2ModelReadLayoutExpliciteStream: aStream
	| layout layouts index frontend |
	layouts := RWDiagramLayoutManager new layoutsOfCurrentPath.
	index := UIManager default chooseFrom: layouts.
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout ofMooseModel: self expliciteStream: aStream.
			self inform: 'Read layout:' , layout.
			frontend := self moose2ModelDependency ].
	^ frontend "Required for automatic tests"