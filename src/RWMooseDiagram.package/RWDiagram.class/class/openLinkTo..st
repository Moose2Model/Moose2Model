sourceAnchor
openLinkTo: aModelElement
	| e |

	"Copies the link to a Model Element
	into the clipboard"
	e := RWDiagramEditor uniqueInstance.
	self openLinkTo: aModelElement ofLayout: e currentLayout