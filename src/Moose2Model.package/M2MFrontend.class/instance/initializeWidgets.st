accessing
initializeWidgets
	| windowMorph tRcanvas |
	tRcanvas := TRCanvas new.
	self makeZoomable: tRcanvas.
	self makeCanvasDraggable: tRcanvas.

	"tRcanvas addShape: (TRBoxShape new size: 2)."
	windowMorph := TRMorph new.
	windowMorph canvas: tRcanvas.
	pane := windowMorph asSpecAdapter.
	pane
		when: MorphOpened
		do: [ Transcript
				cr;
				show: 'Opened';
				cr.
			windowMorph extent: 400 @ 400.
			"windowMorph extent: windowMorph extent asIntegerPoint."
			windowMorph changed ].
	pane widget surface
		drawDuring:
			[ :canvas | "First, we clear the surface" "view widget surface clear." "we can use " pane widget surface clear: Color white ].
	pane changed.
	menu := self mainMenu.
	list := self newList.
	list items: {'Green' . 'Red'}.
	self focusOrder add: list