as yet unclassified
testattributeList
  |e|
e := RWDiagramElement new.
e attributeList: RWDiagramAttributeList new.
self assert: e attributeList class asString equals: 'RWDiagramAttributeList'