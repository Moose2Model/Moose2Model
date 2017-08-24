# Moose2Model

This is a software exploration tool to support developers during their work. 

The intention of this tool is explained in this blogs: [Legacy Code – Storing the mental model in diagrams](https://blogs.sap.com/2017/06/08/legacy-code-storing-the-mental-model-in-diagrams/) and [Software exploration tool for developers (ABAP, SAP, Java, C, Smalltalk, …) – Roadmap](https://blogs.sap.com/2017/07/23/software-exploration-tool-next-steps/).

It can be used in projects. The tool is currently improved, see the Roadmap in the above blog. Feel free to open an issue if you find errors or if you would like to have certain functions.

It can generate diagrams like this:

![An example for a dependency graph](https://github.com/RainerWinkler/Moose2Model/raw/master/ExampleDiagram.png)


It is build on top of Pharo, Roassal and [Moose](http://www.moosetechnology.org/).

# Compatibility
Runs on Moose 6.

Is currently tested on Moose 6.1. You might switch of the warning of deprecated methods under System->Settings.

# Installation

See [YouTube video on how to install this application](https://www.youtube.com/watch?v=_RMeqd5-ZQ4&t=95s) for a complete 14 minute description on how to install and run. This describes the installation using the Pharo Launcher, you may prefer to download a preconfigured image.

## By downloading an Image for Windows

Load the  [Moose2Model Windows Image v0.3.0](http://www.poaceae.de/RWDiagram/Images/Windows/Moose2Model_v0.3.0.zip) and run Pharo.exe after downloading. For Apple and Linux load the [Moose2Model Image and changes v0.3.0](http://www.poaceae.de/RWDiagram/Images/Windows/Moose2Model_v0.3.0_Image_Changes.zip) and add them to a virtual machine for Pharo 5 downloaded from http://pharo.org/download. You may have to add the PharoV50.sources if a warning is raised while starting the machine.

Previous Image:  [Moose2Model Windows Image v0.2.2](http://www.poaceae.de/RWDiagram/Images/Windows/Moose2Model_v0.2.2.zip). Image and Changes (For Apple and Linux: [Moose2Model Image and changes v0.2.2](http://www.poaceae.de/RWDiagram/Images/Windows/Moose2Model_v0.2.2_Image_Changes.zip)

## By installing Pharo, Moose and Moose2Model

### Download Moose 6

Go to [Moose Analysis Installation](http://www.moosetechnology.org/#install) and download an image for Moose 6.0. Extract the zip file, no installer is needed.

### By using the Pharo Launcher

Install the Pharo Launcher from https://ci.inria.fr/pharo/view/Launcher/job/Launcher/ When the installation is done, choose a Moose 6.0 image.

### Add the logic for Moose2Model

Execute the Pharo.exe in the extracted folder. Make a left mouseclick into the Pharo desktop and select Playground. Paste the following code into the Playground:

    Gofer new
        smalltalkhubUser: 'RainerWinkler' project: 'RW-Moose-Diagram';
        package: 'RWMooseDiagram';
        load.

Select the complete coding with the mouse. This is mandatory because the Playground will execute only the marked part of the coding. Make a click with the right mouse button and select Do It. 

# Extractor

Modelinformations for Smalltalk can be extracted with the Moose Panel (See above). 

For SAP applications the extractor [SAP2Moose](http://www.sap2moose.org) can be used. Moose2Model and SAP2Moose are developed in parallel, so this might give the best results.

For Java you can extract mse files with [jdt2famix(https://github.com/feenkcom/jdt2famix).

# Where is the coding and how to contribute

The original coding is hosted in this repository. A copy is stored on Smalltalkhub http://www.smalltalkhub.com/#!/~RainerWinkler/RW-Moose-Diagram (The link may work only in Firefox). This simplifies getting the code.

To participate:

Documentation: Make a fork change or add documentation and make a pull request.

Coding: Install Iceberg, you will probably need to develop on Pharo 6 and Moose 6.1 to do this.

# Examples

A small diagrams that is part of bigger diagrams shown below:

![An example for a dependency graph](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/Complete_application_small_detail_2.png)

This is a commented overview of the SAP2Moose extractor that explains how data is transfered between classes:

![An example for a dependency graph](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/Complete_application_small_detail_1_initial.png)

The above diagram was used during development. After some time new classes where added. And after extracting model data again it displayed the new classes (after some manual dragging of the new elements):

![An example for a dependency graph](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/Complete_application_small_detail_1_later.png)

With different configurations, the whole application is shown:

![An example for a dependency graph](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/Complete_application_small.png)

Here a complete "real life" application:

![An example for a dependency graph](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/Complete_application_big.jpg)

# Documenation

Please see this videos: [Customizable dependency or call graph for SAP ABAP with Pharo Moose ](https://www.youtube.com/watch?v=_RMeqd5-ZQ4&t=224s) and [Demo of a Customizable dependency or call graph with Pharo Moose - Applied to SAP ABAP ](https://www.youtube.com/watch?v=0jLN-2AVIvo&t=1s)

## First steps

Make a left mouse click in the Pharo desktop and select Moose -> Moose Panel. Click in the upper right on the icon with MSE (Import model from file). Select the mse file that is generated with a FAMIX extractor (See above). It is also possible to extract a model from the Smalltalk coding in the Pharo image itself (Icon ST "Import FAMIX Smalltalk model from the current image"). Click on the name of the file. There will now be a list with "All accesses ... All attributes ..."  Make a right click on All classes and choose Visualize -> RW Dependency graph. If the model is very big, it may need some time until the diagram is displayed. See next chapter how to work with it.

The context menu for groups of classes: ![Where to find the diagram](https://github.com/RainerWinkler/SAP2Moose/wiki/figures/WhereToFindInMenu.png)

## Statements

----------------------------------------------------------------------------------------------------
Settings in Playground or at any place where code can be executed
----------------------------------------------------------------------------------------------------
Clear all data

    RWDiagram refresh. 

After this all data is to be reloaded from file or rebuild. Do this as a workaround to prevent inconsistencies that may occur if a model is extracted with new data. In this case some objects may be missed in the diagram if no refresh is done. Use this also to limit the memory consumption.

    RWDiagram currentLayoutName:  'My Layout'.

    RWDiagram currentLayoutName.
    RWDiagram listLayouts.
    RWDiagram list.

    RWDiagram isReading.
    RWDiagram read.
    RWDiagram inActive.

    RWDiagram isReadingPosition.
    RWDiagram readPositions.
    RWDiagram inActivePositions.

    RWDiagram isReadingLayers.
    RWDiagram readLayers: -200.
    RWDiagram inActiveLayers.

    RWDiagram preventOverlapping.
    RWDiagram lCPORepeat: 10.
    RWDiagram lCPOSpace: 1.

Display the actual setting for the space:

    RWDiagram lCPOSpace
    RWDiagram lCPOMaxChecks: 10000000.
    RWDiagram allowOverlapping.
    RWDiagram lCPOMaxChecks.

Display the current number of iterations:

    RWDiagram lCPORepeat

To suppress box and names for packages and classes
(technically the boxes are still there and can be dragged)

    RWDiagram packageBoxSuppressed: true.
    RWDiagram classBoxSuppressed: true.

revert by setting to false.

To change the color for the comment in the current layout (for instance transparent):

    RWDiagram commentColor: Color transparent.

Returns the informations on the processed view

    RWDiagram processedRTView

To read data from a file call:

    RWDiagram readFromFile: 'MyFileNameWithOrWithoutPath.xml'.

The data is loaded to the current view. Existing data is not deleted but overwritten.

To save data to a file call:

    RWDiagram writeToFile: 'MyFileNameWithOrWithoutPath.xml'.

The system saves the data of the current view.

Read a file named like the current Layout from a given path

    RWDiagram  readFromPath: 'MyPath'

To remove all temporary appearance changers from the current layout:

    RWDiagram removeTemporary

It is possible to display names anonymized. Use with care. Errors may occur if settings are saved while this option is active. Set the parameter to false if needed. The parameter will always be reset when a diagram is successcully displayed:
    
    RWDiagramAnonymize anonymize: true.

----------------------------------------------------------------------------------------------------
A Moose Element is inspected
----------------------------------------------------------------------------------------------------
This methods can also be used on a RWDiagramElement

    RWDiagram highlightIncludingMe: true usedByLayers: 1 usingLayers: 1 to: self.

To remove (RWDiagram removeTemporary) can also be performed while inspecting the view.

    RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self.

To comment (add &#60;br&#62; for line break):

    RWDiagram comment: 'My comment<br>Second Line of comment.' to: self.

To remove the appearance changers:

    RWDiagram removeAppearanceChangersFrom: self.

To color a Component of the processed view explicitely:
Navigate to the FAMIX element (for instance in the Moose Panel) and execute:

    RWDiagram color: Color myColor FAMIXComponent: self.

replace myColor with a valid color (green, yellow, ...)

To exclude a package, class, ... together with all sub elements from a diagram (stored to file):
Open the element in an inspector and call (replace true with false to undo):

    RWDiagram suppressWithChildren: true to: self.

----------------------------------------------------------------------------------------------------
The raw tab of a view is inspected
----------------------------------------------------------------------------------------------------

Store positions:

    RWDiagram rememberRTView: self view.

Save positions and other informations to file:

    RWDiagram write: self view toPath: 'MyPath'.

Store positions and save to file in one statements (Performs the previous statements after each other):

    RWDiagram rememberWrite: self view toPath: 'MyPath'.

Set processed view explicitely. Needed if this view is not the last that was executed.

    RWDiagram processedRTView: self view.

Set current layout to the one that corresponds to a diagram:

    RWDiagram setCurrentLayout: self view.

What is the layout the view belongs to?

    RWDiagram layoutForRTView: self view.

# Thanks

I thank Alexandre Bergel for providing the initial coding, giving valuable tips and feedback to support the development of this tool.

# Funding

*CubeServ* is encouraging and supporting this project.

