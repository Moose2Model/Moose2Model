as yet unclassified
testIsReading
|settings|
settings := RWDiagramSettings new.
settings isReading: true.
self assert: settings isReading equals: true