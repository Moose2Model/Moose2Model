as yet unclassified
testElementHandledWithParents
|element|
element := RWDiagramElement new.
element famixElement: FAMIXMethod new.
self assert: element elementHandledWithParents equals: true.
element famixElement: FAMIXAttribute new.
self assert: element elementHandledWithParents equals: true.
element famixElement: FAMIXClass new.
self assert: element elementHandledWithParents equals: false.