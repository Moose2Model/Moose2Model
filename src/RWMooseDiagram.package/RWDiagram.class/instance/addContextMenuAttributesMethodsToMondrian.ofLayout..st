MethodUsage-private
addContextMenuAttributesMethodsToMondrian: aRTMondrian ofLayout: aRWDiagramLayout
	| aRTMenuActivable |
	"Test connection 4"
	aRTMenuActivable := aRTMondrian interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable
		item: 'Add with neighbours'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram
				suppressOthersUsedByLayers: 1
				usingLayers: 1
				to: e model
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Remove Appearance Changers'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram removeAppearanceChangersFrom: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight with neighbours'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 1
				usingLayers: 1
				to: e model
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight used by'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 1
				usingLayers: 0
				to: e model
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 0
				usingLayers: 0
				to: e model
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Hightlight using'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram
				highlightIncludingMe: false
				usedByLayers: 0
				usingLayers: 1
				to: e model
				ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Remove all highlighting'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram removeTemporaryOfLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Comment'
		action: [ :e | 
			| c |
			self setLayoutCurrent: aRWDiagramLayout.
			c := UIManager default textEntry: 'Specify a new comment (use <br> to specify a line break)' title: '' entryText: e model attributeList comment text.
			c ifNotNil: [ RWDiagram comment: c to: e model ofLayout: aRWDiagramLayout ] ].
	aRTMenuActivable
		item: 'Suppress'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			(UIManager default question: 'Do you want to suppress element ' , e model moose2ModelName , ' ?')
				ifTrue: [ RWDiagram suppressWithChildren: true to: e model ofLayout: aRWDiagramLayout ] ].
	aRTMenuActivable
		item: 'Redo suppress'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram suppressWithChildren: false to: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Inspect coding element'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			e model inspect ].
	aRTMenuActivable
		item: 'Inspect diagram element'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			e inspect ].
	aRTMenuActivable
		item: 'Copy link to coding to Clipboard'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram getLinkTo: e model ofLayout: aRWDiagramLayout ].
	aRTMenuActivable
		item: 'Open URL to coding'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			RWDiagram openLinkTo: e model ofLayout: aRWDiagramLayout ]
