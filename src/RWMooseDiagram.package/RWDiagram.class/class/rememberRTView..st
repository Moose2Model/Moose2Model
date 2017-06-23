storePositions
rememberRTView: aRTView
	<RWDiaEdit_5>
	<RWDiaEdit_35>
	<RWDiaEdit_40>
	| e l previousLayoutName |
	e := RWDiagramEditor uniqueInstance.
	"Store the positions of the displayed view to the processed Layout"
	"Set current layout if it is different"
	previousLayoutName := e currentLayoutName.
	l := e layoutForRTView: aRTView message: true.
	l isDefined
		ifTrue: [ e rememberRTView: aRTView to: l.
			previousLayoutName = l name
				ifTrue: [ self inform: 'Positions remembered to layout: ' , l name ]
				ifFalse: [ e currentLayoutName: l name.
					self
						inform:
							'Positions remembered to layout: ' , l name , ' Layout is changed, old: ' , previousLayoutName , ' new: '
								, l name ] ]
		ifFalse: [ UIManager default alert: 'No positions are stored' ]