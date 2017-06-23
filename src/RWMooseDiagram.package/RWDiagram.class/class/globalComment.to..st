commenting
globalComment: aString to: aMooseEntityOrRWDiagramElement
	| e |

	"Add a global comment to a Model Element"
	e := RWDiagramEditor uniqueInstance.
	e addGlobalComments: (RWDiagramGlobalComment text: 'Global') to: aMooseEntityOrRWDiagramElement