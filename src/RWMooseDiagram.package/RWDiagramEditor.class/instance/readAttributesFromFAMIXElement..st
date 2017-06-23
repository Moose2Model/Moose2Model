as yet unclassified
readAttributesFromFAMIXElement: aFAMIXElement
	^ (globalElementGroup apply: [ :e | e ] toAttribute: aFAMIXElement replace: true "Check" ) attributeList