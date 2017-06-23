as yet unclassified
testAsRWDiagramElement
	| editor layout elementGroup |
	editor := RWDiagramEditor new.
	self assert: (method1 asRWDiagramElement: editor) class = RWDiagramElement equals: true.
	self assert: editor globalElementGroup elementList size equals: 1.
	layout := RWDiagramLayout new.
	self assert: (method1 asRWDiagramElement: layout) class = RWDiagramElement equals: true.
	self assert: layout elementGroup elementList size equals: 1.	
	elementGroup := RWDiagramElementGroup new.
	self assert: (method1 asRWDiagramElement: elementGroup) class = RWDiagramElement equals: true.
	self assert: elementGroup elementList size equals: 1