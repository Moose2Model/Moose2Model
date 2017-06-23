as yet unclassified
testComment
	| a co |
	a := RWDiagramAttributeList new.
	co := RWDiagramLocalComment text: 'A comment'.
	a comment: co.
	self assert: a comment equals: co