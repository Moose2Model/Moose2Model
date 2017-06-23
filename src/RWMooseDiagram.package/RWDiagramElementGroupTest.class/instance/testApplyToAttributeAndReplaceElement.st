as yet unclassified
testApplyToAttributeAndReplaceElement
	| eg fe fe2  el el2 |
	eg := RWDiagramElementGroup new.
	fe := FAMIXClass new.
	fe name: 'Dummy'.
	el := RWDiagramElement famixElement: fe.
	self assert: (eg apply: [ :e | e ] toAttribute: el replace: true "Check" ) attributeList class asString equals: 'RWDiagramUndeterminedAttributeList'.
	eg apply: [ :e | RWDiagramAttributeList new ]  toAttribute: el replace: true "Check" .
	self assert: (eg apply: [ :e | e ] toAttribute: el replace: true "Check") attributeList class asString equals: 'RWDiagramAttributeList'.
	fe2 := FAMIXClass new.
	fe2 name: 'Dummy'.
	el2 := RWDiagramElement famixElement: fe2.
	"A dummy operation replaces the element with the element used for the search"
	eg apply: [ :e | e ] toAttribute: el2 replace: true "Check".
	self assert: (eg elementList at: fe2 mooseID) equals: el2