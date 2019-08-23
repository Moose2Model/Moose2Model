as yet unclassified
testRemoveAppearanceChangersFrom
	
	| layout aTRShape aRTElement aAppearanceChanger attributeList |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: true.
	layout moose2ModelName: 'test'.
	aTRShape := TRShape new.
	aRTElement := RTElement new.

	aAppearanceChanger := RWDiagramAppearanceChanger new.

	layout addAppearanceChanger: aAppearanceChanger to: class1RWDE.
	layout  replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE .
	self assert: attributeList appearanceChangerGroup appearanceChangers size equals: 1.
		
	layout removeAppearanceChangersFrom: class1RWDE .
	layout replaceMooseEntities: true.
	attributeList := layout readAttributesFromFAMIXElement: class1RWDE .
	self assert: attributeList appearanceChangerGroup appearanceChangers size equals: 0.
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined