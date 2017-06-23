as yet unclassified
layoutForRTView: aRTView
	"Returns error message if no Layout found"

	layouts
		do: [ :l | 
			l processedRTView == aRTView
				ifTrue: [ ^ l ] ].
	UIManager default alert: 'No Layout found. You should use a RTView that is the last one that is generated using one of the layouts. You may generate the diagram again and repeat the activity'.
	^ RWDiagramUndefinedLayout new