*Moose2Model
moose2ModelReadLayout
	<menuItem: 'Read Layout from path and display' category: 'Moose2Model'>
	| layout layouts index |
	layouts := RWDiagramLayoutManager new layoutsOfCurrentPath.
	index := UIManager default chooseFrom: layouts.
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout ofMooseModel: self.
			self inform: 'Read layout:' , layout.
			self moose2ModelDependency ]