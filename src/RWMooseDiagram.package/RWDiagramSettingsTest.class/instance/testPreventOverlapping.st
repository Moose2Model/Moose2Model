as yet unclassified
testPreventOverlapping
|settings|
settings := RWDiagramSettings new.
self assert: settings preventOverlapping equals: false.
settings preventOverlapping: true.
self assert: settings preventOverlapping equals: true