I store all information for a model element.
I am always part of a RWDiagramElementGroup, so that my attribute List is consistent for a RWDiagramElementGroup.
So create instances of me only using the methods of RWDiagramElementGroup.
I am indexed using my uniqueKey, when I am created I remember my uniqueKey in the instance variable uniqueKey.
When I am neither FAMIXPackage, FAMIXClass, FAMIXAttribute nor FAMIXMethod, my uniqueKey will be the MooseID.
I have a dictionary famixElementHash, this is needed to provide a unique hash value for method hash. This is required because I refefine = and in this case I have to redefine hash also.
I have a dictionary famixElementByUniqueKey. This is currently not used because a similar list in RWDiagramElementGroup is used.
I store in connectedTo all Elements I where invocations  exists on method level on package and class level.
I store in accessedTo all Elements where accesses exists on attribut level on package and class level.