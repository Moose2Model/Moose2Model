as yet unclassified
layerZeroY: aRTView
	| attributeList layerZeroY |
	layerZeroY := nil.
	aRTView elements
		do: [ :element1 | 
			(element1 model class inheritsFrom: RWDiagramAbstractComment)
				ifFalse: [ attributeList := self currentLayout
						readAttributesFromFAMIXElement: element1 model.
					attributeList attributeIsSpecified
						ifTrue: [ attributeList position positionIsDetermined
								ifTrue: [ attributeList appearance othersAreSuppressed
										ifTrue: [ attributeList appearance minimalLayer = 0
												ifTrue: [ layerZeroY ifNil: [ layerZeroY := attributeList position point y ] ] ] ] ] ] ].
	layerZeroY ifNil: [ layerZeroY := 0 ].
	layerZeroY := layerZeroY + self offsetY.
	^ layerZeroY