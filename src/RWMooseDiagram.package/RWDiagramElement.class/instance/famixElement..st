as yet unclassified
famixElement: aFAMIXElement
	(RWDiagramEditor isDiagramElement:aFAMIXElement)
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	famixElement := aFAMIXElement