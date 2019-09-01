as yet unclassified
testRemoveSmallTalkInfixes
   |e t|
e := RWDiagramElement new.
e famixElement: FAMIXClass new.
t := 'FamixStfff'.
self assert: (e removeSmallTalkInfixes: t) equals: 'FAMIXfff'.
t := 'FamixStfff' asLowercase .
self assert: (e removeSmallTalkInfixes: t) equals: 'FAMIXfff' asLowercase 