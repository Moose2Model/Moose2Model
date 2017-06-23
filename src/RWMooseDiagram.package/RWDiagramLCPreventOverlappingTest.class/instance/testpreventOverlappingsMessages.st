as yet unclassified
testpreventOverlappingsMessages
	| v e s lcPO movedElements |
	v := RTView new.
	"First element"
	e := RTElement new.
	s := RTBox new.
	s
		width: 100;
		height: 20.
	e addShape: s.
	e model: (RWDiagramElement famixElement: (FAMIXMethod new)).
	e model famixElement name: 'A'.
	e translateTo: 10 @ 10.
	v add: e.
	"Second element on same position"
	e := RTElement new.
	s := RTBox new.
	s
		width: 100;
		height: 10.
	e addShape: s.
	e model: (RWDiagramElement famixElement: (FAMIXAttribute new)).
	e model famixElement name: 'B'.
	e translateTo: 10 @ 20.
	v add: e.
	"Adapt position"
	lcPO := RWDiagramLCPreventOverlapping new.
	lcPO space: 3.
	lcPO maxChecks: 100.
	lcPO preventOverlappings: v messages: false.
	movedElements := v elements select: [ :each | (each position = (10 @ 10)) not and: (each position = (10 @ 20)) not ].
	self assert: movedElements size equals: 1.
	"Move higher by half of the first heigt (20/2), half of the second heigt (10/2) and by the required space (3)"
	movedElements
		do: [ :each | 
			each model famixElement name = 'B'
				ifTrue: [ self assert: each position equals: 10 @ 28 ]
				ifFalse: [ self assert: each position equals: 10 @ 38 ] ].
	"Do not move if the elements are in X-direction sufficiently separated"
	"First element"
	v := RTView new.
	e := RTElement new.
	s := RTBox new.
	s
		width: 100;
		height: 20.
	e addShape: s.
	e model: (RWDiagramElement famixElement: (FAMIXMethod new)).
	e model famixElement name: 'A'.
	e translateTo: 10 @ 10.
	v add: e.
	"Second element on same position"
	e := RTElement new.
	s := RTBox new.
	s
		width: 100;
		height: 10.
	e addShape: s.
	e model: (RWDiagramElement famixElement: (FAMIXAttribute new)).
	e model famixElement name: 'B'.
	e translateTo: 116 @ 20.
	v add: e.
	"Adapt position"
	lcPO := RWDiagramLCPreventOverlapping new.
	lcPO space: 3.
	lcPO maxChecks: 100.
	lcPO preventOverlappings: v messages: false.
	movedElements := v elements select: [ :each | (each position = (10 @ 10)) not and: (each position = (116 @ 20)) not ].
	self assert: movedElements size equals: 0