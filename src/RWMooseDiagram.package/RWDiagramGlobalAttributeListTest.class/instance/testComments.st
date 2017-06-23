as yet unclassified
testComments
	| ga |
	ga := RWDiagramGlobalAttributeList new.
	self assert: ga comments size equals: 0.
	ga addComment: (RWDiagramGlobalComment text: 'Test').
	self assert: ga comments first text equals: 'Test'