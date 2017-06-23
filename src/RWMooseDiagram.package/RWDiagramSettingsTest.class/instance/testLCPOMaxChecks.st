as yet unclassified
testLCPOMaxChecks
|settings|
settings := RWDiagramSettings new.
self assert: settings lCPOMaxChecks equals: 100000.
settings lCPOMaxChecks: 5.
self assert: settings lCPOMaxChecks equals: 5