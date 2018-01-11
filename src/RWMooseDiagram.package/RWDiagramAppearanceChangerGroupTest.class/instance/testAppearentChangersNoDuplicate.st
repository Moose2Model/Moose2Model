tests
testAppearentChangersNoDuplicate
"Prevent duplicate appearance changers"
|acg ac cd ac2|
acg := RWDiagramAppearanceChangerGroup new.
self assert: acg appearanceChangers size equals: 0.

ac := RWDiagramAppearanceChanger new.
cd := RWDiagramACDStandard new.
acg addAppearentChanger: ac.
self assert: acg appearanceChangers size equals: 1.

ac2 := RWDiagramAppearanceChanger new.
cd := RWDiagramACDStandard new.
acg addAppearentChanger: ac2.
self assert: acg appearanceChangers size equals: 1.
