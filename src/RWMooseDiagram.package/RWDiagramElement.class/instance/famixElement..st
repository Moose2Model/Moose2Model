accessing
famixElement: aFAMIXElement
	"Set list with hash"
	"Set list with elements by key"
	(RWDiagramEditor isDiagramElement: aFAMIXElement)
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	famixElement := aFAMIXElement.
	self determineUniqueKey.
	self setlistWithHash.
	self setListWithUniqueKey