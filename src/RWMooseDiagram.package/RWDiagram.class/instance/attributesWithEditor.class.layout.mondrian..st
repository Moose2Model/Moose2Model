MethodUsage-private
attributesWithEditor: rwEditor class: clsRWDiagramElement layout: rwLayout mondrian: b
<duplicate_attr_color>
	| displayedAttributes |
	displayedAttributes := clsRWDiagramElement dAttributes collect:[:each | (each asRWDiagramElement: rwLayout) ].
		rwEditor settings isReading
		ifTrue: [displayedAttributes := displayedAttributes reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ]].
		
	b shape rectangle
		if: [ :m | rwLayout highlight: m ]
			fillColor: rwLayout colorSchema attributeHighLightedColor;
		if: [ :m | (rwLayout highlight: m) not ]
			fillColor: rwLayout colorSchema attributeColor;
		width: 20;
		height: 20;
		withText: #dName;
		fontSize: 6;
		withTextColor: Color black.
	b nodes: displayedAttributes.
	b layout grid.
	self
		drawComments: b
		modelElements: displayedAttributes
		editor: rwEditor
		entity: self aFAMIXAttribute.
	^ b layout grid