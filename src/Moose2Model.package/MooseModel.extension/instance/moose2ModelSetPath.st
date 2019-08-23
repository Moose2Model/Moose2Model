*Moose2Model
moose2ModelSetPath
	<menuItem: 'Set path to Layouts' category: 'Moose2Model'>
	| path |
	path := UIManager default request: 'Specify path where layouts are stored' initialAnswer: RWDiagram path.
	path
		ifNotNil: [ RWDiagram setPath: path.
			self inform: 'New path' , path ]