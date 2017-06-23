elementGroupAccess
remember: aBlock ofModel: currentRWDiagramElement
   self replaceMooseEntities: true.
	currentRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
		"Element from View"
	elementGroup apply: aBlock toAttribute: currentRWDiagramElement replace: self replaceMooseEntities. "Check"
		self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined