as yet unclassified
testLCPORepeat
|settings|
settings := RWDiagramSettings new.
self assert: settings lCPORepeat equals: 100.
settings lCPORepeat: 15.
self assert: settings lCPORepeat equals: 15