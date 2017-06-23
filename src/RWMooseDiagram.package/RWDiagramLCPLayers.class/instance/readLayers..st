as yet unclassified
readLayers: aRTView
	| attributeList |
	self currentLayout replaceMooseEntities: true.
	aRTView elements
		do: [ :element1 | 
			element1 model class = RWDiagramElement ifTrue:[
			(element1 model famixElement class asString = self aFAMIXMethod
				or: [ element1 model famixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ Transcript
						show: element1 model famixElement parentType name;
						show: ' ';
						show: element1 model famixElement name;
						show: ' '.
					attributeList := self currentLayout
						readAttributesFromFAMIXElement: element1 model.
					attributeList attributeIsSpecified
						ifTrue: [ attributeList appearance othersAreSuppressed
								ifTrue: [ element1
										translateTo:
											element1 position x
												@ ((self layerZeroY: aRTView) + (-1 * 100 * attributeList appearance minimalLayer)).
									Transcript
										show: attributeList appearance minimalLayer asString;
										cr ]
								ifFalse: [ element1 translateTo: 0 @ 0 ] ]
						ifFalse: [ element1 translateTo: 0 @ 0 ] ] ] ].
	self currentLayout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined