tests
testUniqueKey
  |e|
e := RWDiagramElement famixElement: class1.
self assert: 'FAMIXClass>class1' equals: e uniqueKey.
e := RWDiagramElement famixElement: package1.
self assert: 'FAMIXPackage>package1' equals: e uniqueKey.
e := RWDiagramElement famixElement: methodI0.
"The keys are now always converted to lowercase"
self assert: 'FAMIXMethod>class1>methodi0>cl' equals: e uniqueKey.