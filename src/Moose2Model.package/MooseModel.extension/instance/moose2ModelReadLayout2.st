*Moose2Model
moose2ModelReadLayout2
	<menuItem: 'Read Layout from path and display (Old logic)' category: 'Moose2Model'>
		| layout layouts index frontend |
	layouts := RWDiagramLayoutManager new layoutsOfCurrentPath.
	index := UIManager default chooseFrom: layouts.
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout ofMooseModel: self .
			self inform: 'Read layout:' , layout.
			frontend := self moose2ModelDependency ].
	^ frontend "Required for automatic tests"
	"self moose2ModelReadLayoutExpliciteStream: nil."
