diagram
testAddAppearanceChangeTypeTo
	| l aAppearanceChangeType attributeList |
	l := RWDiagramLayout new.
	l replaceMooseEntities: true.
	l name: 'test'.
	aAppearanceChangeType := RWDiagramAppearanceChangeType new.
	l addAppearanceChangeType: aAppearanceChangeType to: methodI0RWDE.
	l replaceMooseEntities: true.
	attributeList := l readAttributesFromFAMIXElement: methodI0RWDE.
	self
		assert: attributeList appearance class asString
		equals: 'RWDiagramAppearance'.
	l replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined