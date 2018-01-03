commenting
comment: aString to: aModelElement
	| e |
	<RWDiaEdit_9>
	<RWDiaEdit_10>
	<RWDiaEdit_63>
	"Add a comment to a Model Element
	Overwrites an existing comment"
	e := RWDiagramEditor uniqueInstance.
	self comment: aString to: aModelElement ofLayout: e currentLayout