as yet unclassified
testCommentColor
|layout|
layout := RWDiagramLayout new.
self assert: layout commentColor equals: layout defaultCommentColor.
layout commentColor: Color yellow.
self assert: layout commentColor equals: Color yellow.