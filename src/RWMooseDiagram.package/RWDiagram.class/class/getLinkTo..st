sourceAnchor
getLinkTo: aModelElement
	| e |

	"Copies the link to a Model Element
	into the clipboard"
	e := RWDiagramEditor uniqueInstance.
	self getLinkTo: aModelElement ofLayout: e currentLayout