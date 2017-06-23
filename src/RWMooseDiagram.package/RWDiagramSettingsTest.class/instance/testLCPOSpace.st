as yet unclassified
testLCPOSpace
|settings|
settings := RWDiagramSettings new.
self assert: settings lCPOSpace equals: 1.
settings lCPORepeat: 5.
self assert: settings lCPORepeat equals: 5