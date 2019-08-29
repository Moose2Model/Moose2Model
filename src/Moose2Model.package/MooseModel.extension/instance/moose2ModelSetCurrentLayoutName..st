*Moose2Model
moose2ModelSetCurrentLayoutName: layout
   "Will be called separately in Unit Tests"
	RWDiagram currentLayoutName: layout.
	self inform: 'New Layout Name' , layout.
	^ RWDiagramEditor uniqueInstance lastUsedClassGroup: self