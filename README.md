# Moose2Model

This is a software exploration tool to support developers during their work. 

# Documentation

The documentation is in the Wiki of this repository (Go to the tab "Wiki").

# Further

The intention of this tool is explained in this blogs: [Legacy Code – Storing the mental model in diagrams](https://blogs.sap.com/2017/06/08/legacy-code-storing-the-mental-model-in-diagrams/) and [Software exploration tool for developers (ABAP, SAP, Java, C, Smalltalk, …) – Roadmap](https://blogs.sap.com/2017/07/23/software-exploration-tool-next-steps/).

See also the most recent presentation [Survive the Chaos - S4H151 - SAP TechED Barcelona 2017 - Lecture](https://www.slideshare.net/RainerWinkler/survive-the-chaos-s4h151-sap-teched-barcelona-2017-lecture-82319920) and the video [Training video of presentation](https://www.youtube.com/watch?v=f_9kkB92TCM&feature=youtu.be&t=1726).

It can be used in projects. The tool is currently improved, see the Roadmap in the above blog. Feel free to open an issue if you find errors or if you would like to have certain functions.

It can generate diagrams like this:

![An example for a dependency graph](https://github.com/RainerWinkler/Moose2Model/raw/master/ExampleDiagram.png)


It is build on top of Pharo, Roassal and [Moose](http://www.moosetechnology.org/).

# Compatibility
Runs on Moose 6.

Is currently tested on Moose 6.1. You might switch of the warning of deprecated methods under System->Settings.

# Supported languages

Modelinformations for Smalltalk can be extracted with the Moose Panel (See above). 

For SAP applications the extractor [SAP2Moose](http://www.sap2moose.org) can be used. Moose2Model and SAP2Moose are developed in parallel, so this might give the best results.

For Java you can extract mse files with [jdt2famix(https://github.com/feenkcom/jdt2famix).

Other computer languages can be extracted to Moose, please check whether there is already an extractor available. Feel free to open an issue to receive supports to make other lanugages working.

# Where is the coding

The original coding is hosted in this repository. A copy is stored on Smalltalkhub http://www.smalltalkhub.com/#!/~RainerWinkler/RW-Moose-Diagram (The link may work only in Firefox). This simplifies getting the code.

# Thanks

I thank Alexandre Bergel for providing the initial coding, giving valuable tips and feedback to support the development of this tool.

# Funding

*CubeServ* is encouraging and supporting this project.
