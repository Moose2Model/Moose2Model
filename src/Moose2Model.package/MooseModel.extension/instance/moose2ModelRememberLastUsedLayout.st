*Moose2Model
moose2ModelRememberLastUsedLayout
	<menuItem: 'Remember last used Layout to file' category: 'Moose2Model'>
	RWDiagram rememberLastUsedDiagram.
	self inform: 'Last used Layout is saved to file'.
	RWDiagramEditor uniqueInstance lastUsedClassGroup: self