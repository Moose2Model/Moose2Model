as yet unclassified
testComment
	| ga al co |
	ga := RWDiagramUndeterminedAttributeList new.
	co := RWDiagramLocalComment text: 'A comment'.
	al := ga comment: co.
	self assert: al class equals: RWDiagramAttributeList.
	self assert: al comment equals: co