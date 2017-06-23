as yet unclassified
testOffsetY
|settings|
settings := RWDiagramSettings new.
self assert: settings offsetY equals: 0.
settings offsetY: 100.
self assert: settings offsetY equals: 100