public-diagram
highlight: aFAMIXElement
	| attributeList |
	self replaceMooseEntities: false.
	attributeList := self readAttributesFromFAMIXElement: aFAMIXElement.
	
   self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
	^ attributeList appearance highlight