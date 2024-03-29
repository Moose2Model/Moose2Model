<code>This project is now replaced by Moose2Model2. FAMIX metamodels will not be supported anymore. The new metamodel is currently named SMOIX (22 May 2022). Please open an issue to get support :-)</code>

# Moose2Model

This is a software exploration tool to support developers during their work. It provides "Circuit Diagram for Software" (But not in the strict sense) that can be easily kept up do date. 

See video [Software Exploration with Moose2Model](https://www.youtube.com/watch?v=k8RkDwlXKmg).

Please contact the developer by opening an issue when you plan to use it to get support.

# Installation

## Get Moose 7.0 by using the Pharo Launcher

Install the Pharo Launcher from http://pharo.org/download
When the installation is done, choose a Moose 7.0 image. You may find it by clicking on New under "Official distributions".
Use Moose 6.1 or 6.0 when you want to display Smalltalk Models, see issue #91.

## Download Moose 7.0 (Alternative to Pharo Launcher)
Use Moose 6.1 or 6.0 when you want to display Smalltalk Models, see issue #91.
Go to [Moose Analysis Installation](http://www.moosetechnology.org/#install) and download an image for Moose 7.0. Extract the zip file, no installer is needed.
Moose 7.0 is based on Pharo 7.0.

## Add the logic for Moose2Model

Please follow this description carefully. The playground and Pharo have some different behaviour compared to other operation systems.

Execute the Pharo.exe in the extracted folder. Go to the menu under Tools and open the Playground. Paste the following code into the Playground:

    Metacello new 
        repository: 'http://ss3.gemstone.com/ss/Moose2Model';
        configuration: 'Moose2Model';
        version: #stable;
        get;
        load.

To get the development version use (You need it to install for experiments on Moose Suite 8):

    Metacello new 
        repository: 'http://ss3.gemstone.com/ss/Moose2Model';
        configuration: 'Moose2Model';
        version: #development;
        get;
        load.

Select the complete coding with the mouse. This is mandatory because the Playground will execute only the marked part of the coding. Make a click with the right mouse button and select Do It. You can use the same statements to get the most actual coding. This is due to the get statements which are not required when the coding is read the first time.

The stable version is release 1.4.0. Development is release 1.4.1 (Includes #102, option to display accesses as arrows).

## Enable links to ABAP Eclipse

To use links to external application, OSProcess needs to be installed. Copy the following text into the same playground and execute in the same way:

    Gofer new squeaksource: 
        'OSProcess'; package: 'OSProcess'; load.
        
## First Steps  

These are described in [First Steps](https://github.com/Moose2Model/Moose2Model/wiki/First-steps).

### Older Moose releases
Moose2Model should also work on the following older releases:
Moose 6.0 (based on Pharo 5.0) and Moose 6.1 (based on Pharo 6.0).

## Check for updates

Follow [Get-updates](https://github.com/Moose2Model/Moose2Model/wiki/Get-updates) to see whether there are code improvements you want to install

# Documentation

The documentation is in the Wiki of this repository (Go to the tab "Wiki").

# Further

The intention of this tool is explained in this blogs: [Legacy Code – Storing the mental model in diagrams](https://blogs.sap.com/2017/06/08/legacy-code-storing-the-mental-model-in-diagrams/) and [Software exploration tool for developers (ABAP, SAP, Java, C, Smalltalk, …) – Roadmap](https://blogs.sap.com/2017/07/23/software-exploration-tool-next-steps/).

See also the most recent presentation [Survive the Chaos - S4H151 - SAP TechED Barcelona 2017 - Lecture](https://www.slideshare.net/RainerWinkler/survive-the-chaos-s4h151-sap-teched-barcelona-2017-lecture-82319920) (Start with slide 51) and the [training video of the presentation](https://www.youtube.com/watch?v=f_9kkB92TCM&feature=youtu.be&t=1726).

It can be used in projects. The tool is currently improved, see the Roadmap in the above blog. Feel free to open an issue if you find errors or if you would like to have certain functions.

It can generate diagrams like this:

![An example for a dependency graph](https://github.com/RainerWinkler/Moose2Model/raw/master/ExampleDiagram.png)


It is build on top of Pharo, Roassal and [Moose](http://www.moosetechnology.org/).

# Compatibility
Runs on Moose 6 and 7. Smalltalk models can currently only be analyzed on Moose 6.

# Supported languages

Modelinformations for Smalltalk can be extracted with the Moose Panel (See above). 

For SAP applications the extractor [SAP2Moose](http://www.sap2moose.org) can be used. Moose2Model and SAP2Moose are developed in parallel, so this might give the best results.

For Java you can extract mse files with [jdt2famix(https://github.com/feenkcom/jdt2famix).

Other computer languages can be extracted to Moose, please check whether there is already an extractor available. Feel free to open an issue to receive supports to make other lanugages working.

# Where is the coding

The original coding is hosted in this repository. A copy is stored on Smalltalkhub http://www.smalltalkhub.com/#!/~RainerWinkler/RW-Moose-Diagram (The link may work only in Firefox). This simplifies getting the code. See wiki under installation how to get and install (https://github.com/Moose2Model/Moose2Model/wiki/Installation)

# Thanks

I thank Alexandre Bergel for providing the initial coding, giving valuable tips and feedback to support the development of this tool.

# Funding

*CubeServ* is encouraging and supporting this project.
