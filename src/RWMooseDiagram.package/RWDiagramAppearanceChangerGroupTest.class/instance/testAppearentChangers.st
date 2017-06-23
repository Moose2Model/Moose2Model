as yet unclassified
testAppearentChangers
|acg ac|
acg := RWDiagramAppearanceChangerGroup new.
self assert: acg appearanceChangers size equals: 0.

ac := RWDiagramAppearanceChanger new.
acg addAppearentChanger: ac.
self assert: acg appearanceChangers size equals: 1.
