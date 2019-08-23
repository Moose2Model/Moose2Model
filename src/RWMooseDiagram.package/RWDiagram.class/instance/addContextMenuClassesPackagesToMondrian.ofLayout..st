MethodUsage-private
addContextMenuClassesPackagesToMondrian: aRTMondrian ofLayout: aRWDiagramLayout
	| aRTMenuActivable |
	aRTMenuActivable := aRTMondrian interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable
		item: 'Comment'
		action: [ :e | 
			| c |
			self setLayoutCurrent: aRWDiagramLayout.
			c := UIManager default textEntry: 'Specify a new comment (use <br> to specify a line break)' title: '' entryText: e model attributeList comment text.
			c ifNotNil: [ RWDiagram comment: c to: e model ofLayout: aRWDiagramLayout ] ].
	aRTMenuActivable
		item: 'Suppress with all contained classes, methods and attributes'
		action: [ :e | 
			self setLayoutCurrent: aRWDiagramLayout.
			(UIManager default question: 'Do you want to suppress element ' , e model moose2ModelName , 'with all contained elements')
				ifTrue: [ RWDiagram suppressWithChildren: true to: e model ofLayout: aRWDiagramLayout ] ].
	aRTMenuActivable
		item: 'Redo suppress with all contained classes, methods and attributes'
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