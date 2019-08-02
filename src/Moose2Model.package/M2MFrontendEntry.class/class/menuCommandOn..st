world menu
menuCommandOn: aBuilder
	"Make entry in the World Menu"

	<worldMenu>
	aBuilder item: #Moose2Model.
	aBuilder withSeparatorAfter.
	(aBuilder
		item: #Moose2Model;
		parent: #Moose2Model) action: [ M2MFrontend new openWithSpec ].
	(aBuilder
		item: #Moose2ModelDemo;
		parent: #Moose2Model) action: [ M2MFrontendDemo new openWithSpec ].
	(aBuilder
		item: #Documentation;
		parent: #Moose2Model) action: [ HelpBrowser openOn: M2MHelp ].
	