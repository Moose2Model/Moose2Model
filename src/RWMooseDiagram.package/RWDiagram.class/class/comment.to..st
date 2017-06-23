commenting
comment: aString to: aModelElement
	| e aRWDiagramElement |
	<RWDiaEdit_9>
	<RWDiaEdit_10>
	<RWDiaEdit_63>
	"Add a comment to a Model Element
	Overwrites an existing comment"
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	e := RWDiagramEditor uniqueInstance.
	e currentLayout comment: aString to: aRWDiagramElement