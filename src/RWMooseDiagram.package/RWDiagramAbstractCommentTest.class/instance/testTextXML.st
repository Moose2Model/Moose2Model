as yet unclassified
testTextXML
	| c |
	c := RWDiagramLocalComment text: 'A<br>B'.
	self assert: c textXML equals: 'A<br>B'