*Moose2Model
moose2ModelSetCurrentLayoutName
	<menuItem: 'Set new Layout name' category: 'Moose2Model'>
	| layout |
	layout := UIManager default request: 'Specify new name for a layout'.
	layout ifNotNil:
		[ self moose2ModelSetCurrentLayoutName: layout ]