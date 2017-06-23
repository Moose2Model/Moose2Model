as yet unclassified
testSuppressOthersActive
  |l|
l := RWDiagramLayout new.
self assert: l suppressOthersActive equals: false.
l suppressOthersActive: true.
self assert: l suppressOthersActive equals: true