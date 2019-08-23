as yet unclassified
testReadPositions
	| layout aRTElement view rpos count editor localComments aRWDElements |
	editor := RWDiagramEditor new.
	layout := editor currentLayout.
	view := RTView new.
	aRTElement := RTElement new.
	aRTElement addShape: RTBox new.
	aRTElement model: class1RWDE.
	view add: aRTElement.
	layout
		remember: [ :attributeList | attributeList position: (15 / 2) @ (179 / 2) ]
		fromRTElement: aRTElement.
	aRTElement := RTElement new.
	aRTElement addShape: RTBox new.
	aRTElement model: method1RWDE.
	view add: aRTElement.
	layout
		remember: [ :attributeList | attributeList position: (3 / 2) @ (5 / 2) ]
		fromRTElement: aRTElement.
	layout suppressWithChildren: true to: aRTElement model.
	layout comment: 'A comment<br>second line' to: aRTElement model.
	layout replaceMooseEntities: true.
	(layout readAttributesFromFAMIXElement: aRTElement model ) comment position: 11 @ 12.	

		aRWDElements := OrderedCollection new.
	aRWDElements add: method1RWDE.
	localComments := editor commentsOf: aRWDElements forLayout: layout.
	aRTElement := RTElement new.
	aRTElement addShape: RTBox new.
	aRTElement model: 	localComments first.
	view add: aRTElement.
	rpos := RWDiagramLCPositions new.
	rpos currentLayout2: layout.
	rpos readPositions: view.

	count := 0.
	view elements
		do: [ :e | 
			e model moose2ModelName = 'a RWDiagramLocalComment' ifTrue: [ count := count + 1.
					self assert: e model position equals: (11@12) ]
				ifFalse:[
			e model famixElement moose2ModelName = 'class1'
				ifTrue: [ count := count + 1.
					self assert: e position equals: (15 / 2) @ (179 / 2) ].
			e model famixElement moose2ModelName = 'method1'
				ifTrue: [ count := count + 1.
					self assert: e position equals: (3 / 2) @ (5 / 2) ] ]
			].
	self assert: count equals: 3