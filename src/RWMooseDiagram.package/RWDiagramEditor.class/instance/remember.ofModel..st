elementGroupAccess
remember: aBlock ofModel: currentRWDiagramElement
   self haltOnce.
	currentRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	globalElementGroup apply: aBlock toAttribute: currentRWDiagramElement replace: true "Check"