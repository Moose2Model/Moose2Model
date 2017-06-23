as yet unclassified
testRemoveAppearanceChangerGroup
	| a ac |
	a := RWDiagramAttributeList new.
	self
		assert: a appearanceChangerGroup appearanceChangers size
		equals: 0.
	ac := RWDiagramAppearanceChanger new.
	a appearanceChangerGroup addAppearentChanger: ac.
	self
		assert: a appearanceChangerGroup appearanceChangers size
		equals: 1.
		
	a removeAppearanceChangerGroup.
			self assert: a appearanceChangerGroup appearanceChangers size
		equals: 0