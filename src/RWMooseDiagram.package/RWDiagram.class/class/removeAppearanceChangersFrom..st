appearanceGeneral
removeAppearanceChangersFrom: aModelElement
<RWDiaEdit_19>
<RWDiaEdit_64>
	| e |
	"Remove all Appearance changes to element (Temporary and permanent)"
	e := RWDiagramEditor uniqueInstance.
	e currentLayout removeAppearanceChangersFrom: aModelElement