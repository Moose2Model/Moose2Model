as yet unclassified
testAttributeIsSpecified
	| ga |
	ga := RWDiagramGlobalAttributeList new.
	self assert: ga attributeIsSpecified equals: true