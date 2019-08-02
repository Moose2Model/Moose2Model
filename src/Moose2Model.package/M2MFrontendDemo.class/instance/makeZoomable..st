as yet unclassified
makeZoomable: aCanvas
	"See class RTZoomableView how this is done
This makes it possible to scroll with the mouse wheel"

	| maxZoom minZoom |
	maxZoom := 10.
	minZoom := 0.1.
	aCanvas
		when: TRMouseWheelEvent
		do: [ :e | 
			| scale dist |
			dist := e position - aCanvas camera position.
			scale := aCanvas camera scale.
			(e isUp and: [ scale * 1.25 <= maxZoom ])
				ifTrue: [ scale := scale * 1.25.
					dist := dist * 0.2 ]
				ifFalse: [ dist := 0 ].
			(e isDown and: [ scale * 0.8 >= minZoom ])
				ifTrue: [ scale := scale * 0.8.
					dist := dist * -0.25 ]
				ifFalse: [ dist := 0 ].
			aCanvas camera
				scale: scale;
				translateBy: dist.
			"aCanvas signalUpdate."
			pane widget changed ]