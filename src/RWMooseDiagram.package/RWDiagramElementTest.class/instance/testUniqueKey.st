tests
testUniqueKey
  |e|
e := RWDiagramElement famixElement: class1.
self assert: 'FAMIXClass>class1' equals: e uniqueKey.
e := RWDiagramElement famixElement: package1.
self assert: 'FAMIXPackage>package1' equals: e uniqueKey.
e := RWDiagramElement famixElement: methodI0.
self assert: 'FAMIXMethod>class1>methodI0>cl' equals: e uniqueKey.