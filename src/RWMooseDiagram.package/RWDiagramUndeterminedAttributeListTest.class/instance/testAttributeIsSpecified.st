as yet unclassified
testAttributeIsSpecified
	| ga |
	ga := RWDiagramUndeterminedAttributeList new.
	self assert: ga attributeIsSpecified equals: false