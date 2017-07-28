sourceAnchor
getLinkTo: aModelElement
	| e aRWDiagramElement |

	"Copies the link to a Model Element
	into the clipboard"
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	e := RWDiagramEditor uniqueInstance.
	e currentLayout getLinkTo: aRWDiagramElement