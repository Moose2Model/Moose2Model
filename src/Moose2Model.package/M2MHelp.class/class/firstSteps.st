accessing
firstSteps
	^ HelpTopic
		title: 'First Steps'
		contents:
			'Open the Moose Panel and import an mse file.
Do a right click of an imported model to get access to the menu of Moose2Model.
You might open the Simple Gui to get some informations.
You might set an alternative path to store and read diagram informations. 
Specify a new diagram name (Otherwise you use a default name).
Select elements of a FAMIX model to add elements to a diagram. This will only work for some elements (Mostly packages, classes, attributes and methods).
Draw a diagram.
Rearange elements as needed. Do a right mouse click to see what is possible. Click on the background to reposition the diagram. Use the scroll wheel of the mouse to zoom in and out.
Redraw when needed.
Store diagram informations to a file. You may use these later, when the application changed to draw actual diagrams even though the coding changed.

When the mse file is extracted with SAP2Moose from an SAP system, Moose2Model will probably work well.
When you analyze Smalltalk you may be required to run Moose2Model on an old Pharo 6 version with old coding.
In all other cases, please try and open an issue.

Go to Moose2Model.org to ask for help and get support.'