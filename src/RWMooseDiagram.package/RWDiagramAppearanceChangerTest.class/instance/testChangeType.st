as yet unclassified
testChangeType
|ac|
ac := RWDiagramAppearanceChanger new.
ac changeType: RWDiagramAppearanceChangeType new.
self assert: ac changeType class asString equals: 'RWDiagramAppearanceChangeType'