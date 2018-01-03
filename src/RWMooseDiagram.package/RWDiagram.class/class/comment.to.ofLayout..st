commenting
comment: aString to: aModelElement ofLayout: aRWDiagramLayout
	| aRWDiagramElement |
	"Add a comment to a Model Element
	Overwrites an existing comment"
	aRWDiagramElement := self convertToRWDiagramElement: aModelElement.
	aRWDiagramLayout comment: aString to: aRWDiagramElement