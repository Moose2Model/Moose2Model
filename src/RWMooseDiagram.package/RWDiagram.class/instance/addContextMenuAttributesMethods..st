MethodUsage-private
addContextMenuAttributesMethods: b
	| aRTMenuActivable |
	aRTMenuActivable := b interaction menu.	"Context menu attributes and methods"
	aRTMenuActivable
		item: 'Add with Neighbours'
		action:
			[ :e | RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: e model ].
	aRTMenuActivable
		item: 'Hightlight with Neighbours'
		action: [ :e | 
			RWDiagram
				highlightIncludingMe: true
				usedByLayers: 1
				usingLayers: 1
				to: e model ].
	aRTMenuActivable
		item: 'Remove Appearance Changers'
		action: [ :e | RWDiagram removeAppearanceChangersFrom: e model ].
	aRTMenuActivable
		item: 'Remove all Highlighting'
		action: [ :e | RWDiagram removeTemporary ]