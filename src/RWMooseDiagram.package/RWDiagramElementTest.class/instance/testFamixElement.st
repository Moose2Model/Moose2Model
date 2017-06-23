as yet unclassified
testFamixElement
  |e|
e := RWDiagramElement new.
e famixElement: FAMIXClass new.
self assert: e famixElement class asString equals: 'FAMIXClass'