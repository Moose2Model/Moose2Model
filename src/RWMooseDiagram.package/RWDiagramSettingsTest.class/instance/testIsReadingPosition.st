as yet unclassified
testIsReadingPosition
|settings|
settings := RWDiagramSettings new.
settings isReadingPosition: true.
self assert: settings isReadingPosition equals: true