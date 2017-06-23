as yet unclassified
testAttributeIsSpecified
	| ga |
	ga := RWDiagramAttributeList new.
	self assert: ga attributeIsSpecified equals: true