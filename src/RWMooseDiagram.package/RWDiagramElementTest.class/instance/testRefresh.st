tests
testRefresh
  |e|
e := RWDiagramElement new.
e famixElement: FAMIXClass new.
e refresh.
self assert: e famixElement equals: nil