as yet unclassified
isDiagramElement: anElement 
	^(anElement class inheritsFrom: MooseEntity ) or: anElement class = RWDiagramNoPackage