connections
relatesTo: aRWDiagramElement
"This will be obsolete if only information flow is supported:"
	self connectedTo: aRWDiagramElement.
	"This is the information flow"
	aRWDiagramElement connectedFrom: self