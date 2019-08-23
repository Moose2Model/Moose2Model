diagram
testAddAppearanceChangerTo
	| l aAppearanceChanger attributeList |
	l := RWDiagramLayout new.
	l replaceMooseEntities: true.
	l moose2ModelName: 'test'.
	aAppearanceChanger := RWDiagramAppearanceChanger new.
	l addAppearanceChanger: aAppearanceChanger to: class1RWDE.
	l replaceMooseEntities: true.
	attributeList := l readAttributesFromFAMIXElement: class1RWDE.
	self assert: attributeList appearanceChangerGroup appearanceChangers size equals: 1.
	l replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined