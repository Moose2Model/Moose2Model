tests
testFullDisplayOfMooseModel
	"This tests that an explicitely created Moose Model is displayed correctly.
	1. Create a Moosemode
	2. Display it completely in the forntend
	3. Search for a certain method and add it and only neighbours to diagram
	4. Clear the frontend and open the diagram again (Do not read from file but from the remembered informations)
	5. CHeck that now only a restricted number of elements is shown"

	| model frontend |

	"Check all elements"
	"There has to be at least a single correctly named element"
	"The next elements belong to the legend"
	"Check all edges"
	"Remember diagram to file"
	"Close the frontend"
	"Open it again"
	"Now only a restricted list of elements is displayed"
	"frontend inspect."
	"Check elements"
	"The legend"
	"Check edges"
	"RWDiagram automaticTestIsRunning: true."
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
	frontend window close
   "Now refresh and try to load again from file"	
   model moose2ModelRefresh.

 