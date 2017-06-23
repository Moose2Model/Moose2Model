as yet unclassified
testMaxChecks
| lcPO |
lcPO := RWDiagramLCPreventOverlapping new.
self assert: lcPO maxChecks equals: 0.
lcPO maxChecks: 5.
self assert: lcPO maxChecks equals: 5