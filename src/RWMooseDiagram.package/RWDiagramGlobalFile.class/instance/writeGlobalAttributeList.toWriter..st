as yet unclassified
writeGlobalAttributeList: aAttrList toWriter: aWriter
	||
   self haltOnce.
	aAttrList attributeIsSpecified
		ifTrue: [  ]