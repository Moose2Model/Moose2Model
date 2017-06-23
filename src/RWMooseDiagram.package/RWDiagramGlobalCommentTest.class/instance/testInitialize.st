as yet unclassified
testInitialize
  | gc1 gc2 |
gc1 := RWDiagramGlobalComment text: 'A'.
gc2 := RWDiagramGlobalComment text: 'B'.
self assert: gc1 id = gc2 id equals: false
