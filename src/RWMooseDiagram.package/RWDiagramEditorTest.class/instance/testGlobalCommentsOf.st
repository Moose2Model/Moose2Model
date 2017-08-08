public
testGlobalCommentsOf
	| b rwEditor comments  element aRWDElement aRWDElements |
	b := RTMondrian new.
	rwEditor := RWDiagramEditor new.
	element := FAMIXClass new.
	element name: 'Class1'.
	aRWDElement := RWDiagramElement famixElement: element.
	aRWDElements := OrderedCollection new.
	aRWDElements add: aRWDElement.
	rwEditor currentLayout comment: 'Test' to: aRWDElement.
	rwEditor addGlobalComments: (RWDiagramGlobalComment text: 'Global') to: aRWDElement.
	comments := rwEditor globalCommentsOf: aRWDElements.
	self assert: (comments select:[:each|each text = 'Global' ] )size equals: 1.
	self assert: (comments select:[:each|each text = 'Test' ] )size equals: 0.
	self assert: (comments select:[:each|each text = 'Else' ] )size equals: 0.
	self assert: comments first mooseID equals: aRWDElement uniqueKey