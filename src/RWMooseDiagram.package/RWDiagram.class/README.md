I have the logic for drawing diagrams (Currently using Mondrian)

I have as class methods also a lot of shortcuts:

Manage reading and modifying positions and other features in applications that use diagrams based on RTMondrian.

--------------------------------------------------------------------------------------------------------------------
Layout:
--------------------------------------------------------------------------------------------------------------------

- Data can be read and stored to different views:
RWDiagram currentLayoutName: 'MyView'.

- To get the name of the current layout call:

RWDiagram currentLayoutName

- To set the current Layout to the one that corresponds to a diagram:
Option 1: Select the tab Raw on the inspected RTMondrian. Then perform:
RWDiagram setCurrentLayout: self view.

Option 2: Open an inspector on the view of the inspected RTMondrian. Then perform:
RWDiagram setCurrentLayout: self

- To get the Layout that corresponds to a diagram (see setCurrentLayout for details of syntax) call:
RWDiagram layoutForRTView: self view.

--------------------------------------------------------------------------------------------------------------------
Store positions:
--------------------------------------------------------------------------------------------------------------------

- To store positions call:
The positions are stored to the layout that has the same processed RTView

Option 1: Select the tab Raw on the inspected RTMondrian. Then perform:
RWDiagram rememberRTView: self view.

Option 2: Open an inspector on the view of the inspected RTMondrian. Then perform:
RWDiagram rememberRTView: self

--------------------------------------------------------------------------------------------------------------------
Adapt new diagram:
--------------------------------------------------------------------------------------------------------------------

Only diagrams that support this editor are adapted. This is currently for a class group. "RW Method Usages in Packages" in the category visualize.
You should display the diagram on "all classes" and not on "all model classes" , only then also interfaces and ... are displayed.

- To create a new diagram using the stored layout attributes use:
RWDiagram read.
- To create a new diagram using the stored position use:
RWDiagram readPositions.

- To inactivate the logic call: 
RWDiagram inActive.
RWDiagram inActivePositions.

- To display whether the logic is active print:
RWDiagram isReading
RWDiagram isReadingPosition

- To suppress box and names for packages and classes
(technically the boxes are still there and can be dragged)
RWDiagram packageBoxSuppressed: true.
RWDiagram classBoxSuppressed: true.
revert by setting to false.

--------------------------------------------------------------------------------------------------------------------
Prevent Overlapping:
--------------------------------------------------------------------------------------------------------------------
- Specify whether overlapping of Methods, Attributes and Comments is to be suppressed
RWDiagram preventOverlapping 
RWDiagram allowOverlapping

- Specify the number of iterations while preventing overlapping:
RWDiagram lCPORepeat: 10
- Display the current number of iterations:
RWDiagram lCPORepeat

- Set a space between elements:
RWDiagram lCPOSpace: 5
- Display the actual setting for the space:
RWDiagram lCPOSpace
--------------------------------------------------------------------------------------------------------------------
Commenting:
--------------------------------------------------------------------------------------------------------------------

- To comment an Element
RWDiagram comment: 'A comment' to: self
or with multiple lines:
RWDiagram comment: 'A comment<br>Second line' to: self

- To change the color for the comment in the current layout (for instance transparent):
RWDiagram commentColor: Color transparent.

--------------------------------------------------------------------------------------------------------------------
File access:
--------------------------------------------------------------------------------------------------------------------

- To save data to a file call:
RWDiagram writeToFile: 'ModelFormattingData.xml'.
The system saves the data of the current view.

- To save data for a view to the layout it belongs in a path (Perform on the raw tab of the inspector of the view):
RWDiagram write: self view  toPath: aPath

- To read data from a file call:
RWDiagram readFromFile: 'ModelFormattingData.xml'.
The data is loaded to the current view. Existing data is not deleted but overwritten.

--------------------------------------------------------------------------------------------------------------------
Actions on processed view:
--------------------------------------------------------------------------------------------------------------------

- Actions on a displayed diagram are by default performed on the processed view. 
This can be set explecitely for a RTMondrian:
RWDiagram processedRTView: self view.
or is done when a diagram is created using this logic.

- To color a Component of the processed view explicitely:
Navigate to the FAMIX element (for instance in the Moose Panel) and execute:
RWDiagram color: Color myColor FAMIXComponent: self.
replace myColor with a valid color (green, yellow, ...)

--------------------------------------------------------------------------------------------------------------------
Appearance (temporary and on processed view):
--------------------------------------------------------------------------------------------------------------------
Click on a element in the diagram and perform the following in the editor:

- To change the appearance of an element and his neighbours (is not  stored):

RWDiagram highlightIncludingMe: true usedByLayers: 2 usingLayers: 2  to: self

- To remove all temporary appearance changers from the current layout:
RWDiagram removeTemporary

--------------------------------------------------------------------------------------------------------------------
Appearance (permanent/stored to file):
--------------------------------------------------------------------------------------------------------------------
- To exclude everthing not selected with using and used layers:
Open the element in an inspector and call (replace true with false to undo):
RWDiagram suppressOthersUsedByLayers: usedByLayers usingLayers: usingLayers to: self

- To exclude a package, class, ... together with all sub elements from a diagram (stored to file):
Open the element in an inspector and call (replace true with false to undo):
RWDiagram suppressWithChildren: true to: self.

--------------------------------------------------------------------------------------------------------------------
Appearance (general):
--------------------------------------------------------------------------------------------------------------------

- To remove the appearance changers:
RWDiagram removeAppearanceChangersFrom: self

--------------------------------------------------------------------------------------------------------------------
Listings:
--------------------------------------------------------------------------------------------------------------------
- To list all available Layouts
RWDiagram listLayouts

- To show the setting of the current Layout
RWDiagram list


