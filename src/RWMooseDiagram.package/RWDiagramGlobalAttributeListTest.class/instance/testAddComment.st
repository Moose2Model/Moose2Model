as yet unclassified
testAddComment
	| ga |
	ga := RWDiagramGlobalAttributeList new.
	ga addComment: (RWDiagramGlobalComment text: 'Test').
	self assert: ga comments first text equals: 'Test'