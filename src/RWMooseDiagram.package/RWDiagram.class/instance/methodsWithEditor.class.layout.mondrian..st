MethodUsage-private
methodsWithEditor: rwEditor class: clsRWDiagramElement layout: rwLayout mondrian: b
	<duplicate_meth_color>
	| displayedMethods |
	b shape rectangle
		if: [ :m | rwLayout highlight: m ] fillColor: rwLayout colorSchema methodHighLightedColor;
		if: [ :m | (rwLayout highlight: m) not ] fillColor: rwLayout colorSchema methodColor;
		width: 20;
		height: 20;
		withText: #dName;
		fontSize: 6;
		withTextColor: Color black.
	displayedMethods := clsRWDiagramElement dMethods collect:[:each | (each asRWDiagramElement: rwLayout)].
	rwEditor settings isReading
		ifTrue: [ displayedMethods := displayedMethods reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ] ].
	b nodes: displayedMethods.
	b layout grid.
	self
		drawComments: b
		modelElements: displayedMethods
		editor: rwEditor
		entity: self aFAMIXMethod.
	^ b layout grid