as yet unclassified
writeAttributeList: aAttrList toWriter: aWriter
	| changeType changeDeterminer |
	aAttrList attributeIsSpecified
		ifTrue: [ aAttrList position positionIsDetermined
				ifTrue: [ aWriter
						tag: #x with: (aAttrList position point x asFloat round: 8) asString;
						tag: #y with: (aAttrList position point y asFloat round: 8) asString ].
			aAttrList suppressWithChildren
				ifTrue: [ aWriter tag: #supressWithChildren with: #true ].
			aAttrList comment exists
				ifTrue: [ aWriter tag: #comment with: [ aWriter cdata: aAttrList comment textXML ].
					aAttrList comment positionSet
						ifTrue: [ aWriter
								tag: #commentx with: (aAttrList comment position x asFloat round: 8) asString;
								tag: #commenty with: (aAttrList comment position y asFloat round: 8) asString ] ].
			aAttrList appearanceChangerGroup appearanceChangers
				do: [ :ac | 
					ac changeType isTemporary
						ifFalse: [ ac changeType class asString = 'RWDiagramACTSuppressOthers'
								ifTrue: [ changeType := #ACTSuppressOthers ].
							ac changeDeterminer class asString = 'RWDiagramACDStandard'
								ifTrue: [ changeDeterminer := #ACDStandard ].
							aWriter
								tag: changeType
								with: [ aWriter tag: #type with: changeDeterminer.
									changeDeterminer = #ACDStandard
										ifTrue: [ aWriter tag: #includeMe with: ac changeDeterminer includeMe asString;
											               tag: #usedByLayers with: ac changeDeterminer usedByLayers asString;
											               tag: #usingLayers with: ac changeDeterminer usingLayers asString  ] ] ] ] ]