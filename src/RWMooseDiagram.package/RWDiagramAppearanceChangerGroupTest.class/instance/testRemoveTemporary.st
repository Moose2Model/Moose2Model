as yet unclassified
testRemoveTemporary
	| acg ac |
	ac := RWDiagramAppearanceChanger new.
	ac changeType: RWDiagramACTHighlight new.
	acg := RWDiagramAppearanceChangerGroup new.
	acg addAppearentChanger: ac.
	acg removeTemporary.
	self assert: acg appearanceChangers size equals: 0