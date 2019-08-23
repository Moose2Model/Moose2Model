accessing
initializeWidgets
	| windowMorph tRcanvas|
	rtView ifNil:[
	rtView := RTView new. rtView add: (RTLabel elementOn: 'Hello World').].
	
	"tRcanvas := TRCanvas new.
	self makeZoomable: tRcanvas.
	self makeCanvasDraggable: tRcanvas."

	"tRcanvas addShape: (TRBoxShape new size: 2)."
	windowMorph := TRMorph new.
	windowMorph canvas: rtView canvas.
	pane := windowMorph asSpecAdapter.
	pane
		when: MorphOpened
		do: [ 
	windowMorph hResizing: #spaceFill.
	windowMorph vResizing: #spaceFill.
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