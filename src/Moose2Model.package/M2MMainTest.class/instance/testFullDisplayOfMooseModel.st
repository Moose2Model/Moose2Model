tests
testFullDisplayOfMooseModel
	"This tests that an explicitely created Moose Model is displayed correctly.
	1. Create a Moosemode
	2. Display it completely in the forntend
	3. Search for a certain method and add it and only neighbours to diagram
	4. Clear the frontend and open the diagram again (Do not read from file but from the remembered informations)
	5. Check that now only a restricted number of elements is shown
	6. Refresh again
	7. Read diagram information from file
	8. Check that the diagram is restricted as specified in the file"
	

	| model frontend |
	model := self makeTestMooseModel.
	model moose2ModelRefresh.
	model moose2ModelSetCurrentLayoutName: 'LayoutUsedByAutomaticTests'.
	frontend := model moose2ModelDependency.
	"Is the title correct?"
	self assert: frontend title equals: 'LayoutUsedByAutomaticTests - A MooseModel for a Unit Test'.
	"Now check the diagram in detail"
	self checkNotRestricted: frontend.

	"Navigate to methodI0 and perform a right mouseclick on 'Add with neighbours'."
	self fronted: frontend element: 'a RWDiagramElement class1>>methodI0 (Method)' DoContextMenu: 'Add with neighbours'.
	"Right click on the pane and remember to file"
	self frontend: frontend DoContextMenuOnPane: 'Remember to file'.
	frontend window close.
	"Display again"
	frontend := model moose2ModelDependency.
	"Check the now restricted diagram"
	self checkRestricted: frontend.
	frontend window close.
	"Now refresh and try to load again from file"
	model moose2ModelRefresh.
	frontend := model moose2ModelReadLayoutExpliciteFile: 'LayoutUsedByAutomaticTests'.
	self checkRestricted: frontend.
	"frontend inspect."
	frontend window close