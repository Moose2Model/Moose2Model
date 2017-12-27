MethodUsage-private
addContextMenuClassesPackages: b
	| aRTMenuActivable |
	aRTMenuActivable := b interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable
		item: 'Comment'
		action: [ :e | 
			| c |
			c := UIManager default textEntry: 'Specify a new comment' title: '' entryText: e model attributeList comment text.
			c ifNotNil: [ RWDiagram comment: c to: e model ] ].
	aRTMenuActivable
		item: 'Suppress with all contained classes, methods and attributes'
		action: [ :e | 
			(UIManager default question: 'Do you want to suppress element ' , e model name , 'with all contained elements')
				ifTrue: [ RWDiagram suppressWithChildren: true to: e model ] ].
	aRTMenuActivable item: 'Redo suppress with all contained classes, methods and attributes' action: [ :e | RWDiagram suppressWithChildren: false to: e model ]