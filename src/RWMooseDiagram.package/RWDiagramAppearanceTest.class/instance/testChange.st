as yet unclassified
testChange
	| a ac |
	a := RWDiagramAppearance new.
	ac := RWDiagramACTHighlight new.
	a change: ac.
	self assert: a highlight equals: true