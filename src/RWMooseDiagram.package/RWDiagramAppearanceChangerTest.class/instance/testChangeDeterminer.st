as yet unclassified
testChangeDeterminer
|ac|
ac := RWDiagramAppearanceChanger new.
ac changeDeterminer: RWDiagramAppearanceChangeDeterminer new.
self assert: ac changeDeterminer class asString equals: 'RWDiagramAppearanceChangeDeterminer'