*RWMooseDiagram
moose2ModelSetCurrentLayoutName
	<menuItem: 'Set new Layout Name' category: 'Moose2Model'>
	| layout |
	layout := UIManager default request: 'Specify new name for a layout'.
	layout
		ifNotNil: [ RWDiagram currentLayoutName: layout.
			self inform: 'New Layout Name' , layout.
			RWDiagramEditor uniqueInstance lastUsedClassGroup: self ]