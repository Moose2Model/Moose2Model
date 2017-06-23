as yet unclassified
testReplaceMooseEntities
|layout|
layout := RWDiagramLayout new.
self assert: layout replaceMooseEntities equals: RWDiagramLayout replaceMooseEntitiesUndefined.
layout replaceMooseEntities: true.
 self assert: layout replaceMooseEntities equals: true.
layout replaceMooseEntities: false.
 self assert: layout replaceMooseEntities equals: false.
layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined.
self assert: layout replaceMooseEntities equals: RWDiagramLayout replaceMooseEntitiesUndefined
