sourceAnchor
openLinkTo: aModelElement ofLayout: aRWDiagramLayout
	| aRWDiagramElement |

	"Copies the link to a Model Element
	into the clipboard"
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	aRWDiagramLayout openLinkTo: aRWDiagramElement