as yet unclassified
testCleanCDATA
| l raw |
l := RWDiagramLayout new.
raw := 'Test', String lf, String space.
self assert: (l cleanCDATA: raw) equals: 'Test'