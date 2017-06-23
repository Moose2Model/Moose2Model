public-diagram
othersAreSuppressed: aFAMIXElement
	| attributeList |
	self replaceMooseEntities: false.
	attributeList := self readAttributesFromFAMIXElement: aFAMIXElement.
   self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
	^ attributeList appearance othersAreSuppressed