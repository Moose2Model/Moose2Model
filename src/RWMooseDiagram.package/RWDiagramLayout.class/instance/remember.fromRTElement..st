accessing
remember: aBlock fromRTElement: aRTElement
"aBlock has to return the attribute list. In many cases a method on a undefinde attribute list returns a defined attribute list."
	| currentModel |
	aRTElement
		ifNotNil: [ aRTElement model
				ifNotNil: [ 
					aRTElement
						ifNotNil: [ currentModel := aRTElement model.
							currentModel ifNotNil: [ 
								((currentModel class inheritsFrom: MooseEntity) or: currentModel class = RWDiagramElement ) ifTrue:[
								self remember: aBlock ofModel: (currentModel asRWDiagramElement: self)] ] ] ] ]