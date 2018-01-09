MethodUsage-private
addContextMenuAttributesMethodsToMondrian: aRTMondrian ofLayout: aRWDiagramLayout
	| aRTMenuActivable |
	aRTMenuActivable := aRTMondrian interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable item: 'Add with neighbours' action: [ :e | RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable item: 'Remove Appearance Changers' action: [ :e | RWDiagram removeAppearanceChangersFrom: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight with neighbours'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 1
				usingLayers: 1
				to: e model 
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight used by'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 1
				usingLayers: 0
				to: e model 
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 0
				usingLayers: 0
				to: e model 
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight using'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 0
				usingLayers: 1
				to: e model 
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable item: 'Remove all highlighting' action: [ :e | RWDiagram removeTemporaryOfLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Comment'
		action: [ :e | 
			| c |
			c := UIManager default textEntry: 'Specify a new comment' title: '' entryText: e model attributeList comment text.
			c ifNotNil: [ RWDiagram comment: c to: e model ofLayout: aRWDiagramLayout ] ].
	aRTMenuActivable item: 'Inspect' action: [ :e | e inspect ].
	aRTMenuActivable item: 'Copy link to coding to Clipboard' action: [ :e | RWDiagram getLinkTo: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable item: 'Open URL to coding' action: [ :e | RWDiagram openLinkTo: e model ofLayout: aRWDiagramLayout ]