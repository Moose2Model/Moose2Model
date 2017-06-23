as yet unclassified
testText
	| c |
	c := RWDiagramLocalComment text: 'A comment'.
	self assert: c text equals: 'A comment'.
	c := RWDiagramLocalComment new.
	c text: 'A comment 2'.
	self assert: c text equals: 'A comment 2'.
	c text: 'A<br>B'.
	self assert: c text equals: 'A',String crlf, 'B'.
	c text: 'A-Linebreak-B'.
	self assert: c text equals: 'A',String crlf, 'B'