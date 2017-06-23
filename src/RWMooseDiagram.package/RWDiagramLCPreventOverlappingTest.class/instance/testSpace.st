as yet unclassified
testSpace
| lcPO |
lcPO := RWDiagramLCPreventOverlapping new.
self assert: lcPO space equals: 0.
lcPO space: 5.
self assert: lcPO space equals: 5