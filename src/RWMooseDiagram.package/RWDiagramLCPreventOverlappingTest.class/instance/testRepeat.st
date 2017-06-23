as yet unclassified
testRepeat
| lcPO |
lcPO := RWDiagramLCPreventOverlapping new.
self assert: lcPO repeat equals: 1.
lcPO repeat: 5.
self assert: lcPO repeat equals: 5