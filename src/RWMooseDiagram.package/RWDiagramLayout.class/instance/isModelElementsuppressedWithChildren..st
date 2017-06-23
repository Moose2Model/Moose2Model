elementGroupAccess
isModelElementsuppressedWithChildren: aRWDiagramElement
	| attributeList |
	self replaceMooseEntities: false.
	attributeList := self readAttributesFromFAMIXElement: aRWDiagramElement.
   self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
   ^ attributeList suppressWithChildren 