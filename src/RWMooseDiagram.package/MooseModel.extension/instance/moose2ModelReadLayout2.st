*RWMooseDiagram
moose2ModelReadLayout2
"Backup of old logic, calls the inspector of the view"
	<menuItem: 'Read Layout from path and display 2' category: 'Moose2Model'>
	| layout layouts index |
	layouts := RWDiagramLayoutManager new layoutsOfCurrentPath.
	index := UIManager default chooseFrom: layouts.
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout ofMooseModel: self.
			self inform: 'Read layout:' , layout.
			self moose2ModelDependency2 ]