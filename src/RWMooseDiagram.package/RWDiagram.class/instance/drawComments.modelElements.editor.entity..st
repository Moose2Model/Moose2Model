MethodUsage-private
drawComments: b modelElements: aMooseElements editor: rwEditor entity: aFAMIXEntity
	| comments globalComments relevantComments relevantGlobalComments allComments |
	relevantComments := Bag new.
	relevantGlobalComments := Bag new.

	comments := rwEditor commentsOf: aMooseElements.	" Draw comments for packages"
	comments
		do: [ :c | 
			aMooseElements
				do: [ :e | 
					e class = RWDiagramElement
						ifTrue: [ c uniqueKeyOfCommentedElement = e uniqueKey
								ifTrue: [ relevantComments add: c ] ]ifFalse:[] ] ].
	globalComments := rwEditor globalCommentsOf: aMooseElements.	" Draw comments for packages"
	globalComments
		do: [ :c | 
			aMooseElements
				do: [ :e | 
					e class = RWDiagramElement
						ifTrue: [ c uniqueKeyOfCommentedElement = e uniqueKey
								ifTrue: [ relevantGlobalComments add: c ] ] ] ].
	b shape
		rectangle;
		width: 60;
		height: 20;
		withText: #text;
		fontSize: rwEditor currentLayout colorSchema commentFontSize;
		withTextColor: Color black;
		fillColor: rwEditor currentLayout commentColor;
		noBorder.
	b nodes: relevantComments.
	b shape
		rectangle;
		width: 60;
		height: 20;
		withText: #text;
		withTextColor: Color black;
		fillColor: rwEditor defaultGlobalCommentColor;
		noBorder.
	b nodes: relevantGlobalComments.
	"Connect elements to comments"
	b shape
		line
		color: Color orange trans;
		withShorterDistanceAttachPoint.
	allComments := relevantComments union: relevantGlobalComments.
	allComments
		do: [ :c | 
			(c class inheritsFrom: RWDiagramAbstractComment)
				ifTrue: [ b view elements
						do: [ :e | 
							e model class = RWDiagramElement
								ifTrue: [ (e model famixElement class inheritsFrom: MooseEntity)
										ifTrue: [ c uniqueKeyOfCommentedElement = e model uniqueKey
												ifTrue: [ b edges connectFrom: c to: e model ] ] ] ] ] ].
	^ allComments