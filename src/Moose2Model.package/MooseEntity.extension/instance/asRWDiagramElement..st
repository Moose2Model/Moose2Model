*Moose2Model
asRWDiagramElement: aRWDiagramElementGroupOrLayoutOrEditor
	"Replaces a FAMIX Element (Moose Entity) with a RWDiagramElement that has the same attributes a specified in either a RWDiagramEditor, a RWDiagramLayout or a RWDiagramElementGroup"

	| elementGroup |
	aRWDiagramElementGroupOrLayoutOrEditor class = RWDiagramEditor
		ifTrue: [ elementGroup := aRWDiagramElementGroupOrLayoutOrEditor globalElementGroup ]
		ifFalse: [ aRWDiagramElementGroupOrLayoutOrEditor class = RWDiagramLayout
				ifTrue: [ elementGroup := aRWDiagramElementGroupOrLayoutOrEditor elementGroup ]
				ifFalse: [ elementGroup := aRWDiagramElementGroupOrLayoutOrEditor ] ].
	^ elementGroup apply: [ :e | e ] toAttribute: self replace: true