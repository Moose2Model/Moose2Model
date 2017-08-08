as yet unclassified
testUniqueKeyOfCommentedElement
	| c |
	c := RWDiagramAbstractComment new.
	c uniqueKeyOfCommentedElement: '1'.
	self assert: c uniqueKeyOfCommentedElement equals: '1'