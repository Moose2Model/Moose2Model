MethodUsage-private
addContextMenuAttributesMethods: b
	| aRTMenuActivable |
	aRTMenuActivable := b interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable item: 'Add with Neighbours' action: [ :e | RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: e model ].
	aRTMenuActivable item: 'Remove Appearance Changers' action: [ :e | RWDiagram removeAppearanceChangersFrom: e model ].
	aRTMenuActivable
		item: 'Hightlight with Neighbours'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 1
				usingLayers: 1
				to: e model ].
	aRTMenuActivable
		item: 'Hightlight Used By'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 1
				usingLayers: 0
				to: e model ].
	aRTMenuActivable
		item: 'Hightlight'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 0
				usingLayers: 0
				to: e model ].
	aRTMenuActivable
		item: 'Hightlight Using'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 0
				usingLayers: 1
				to: e model ].
	aRTMenuActivable item: 'Remove all Highlighting' action: [ :e | RWDiagram removeTemporary ].
	aRTMenuActivable
		item: 'Comment'
		action: [ :e | 
			| c |
			c := UIManager default textEntry: 'Specify a new comment' title: '' entryText: e model attributeList comment text.
			c ifNotNil: [ RWDiagram comment: c to: e model ] ].
	aRTMenuActivable item: 'Inspect' action: [ :e | e inspect ].
	aRTMenuActivable item: 'Copy Link to coding to Clipboard' action: [ :e | RWDiagram getLinkTo: e model ].
	aRTMenuActivable item: 'Open URL to coding' action: [ :e | RWDiagram openLinkTo: e model ].