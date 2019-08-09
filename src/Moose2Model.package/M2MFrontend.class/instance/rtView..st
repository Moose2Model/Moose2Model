accessing
rtView: aRTView
|windowMorph|
   myTitle := RWDiagramEditor uniqueInstance currentLayoutName.
	rtView := aRTView.
	
	windowMorph := TRMorph new.
	windowMorph canvas: rtView view canvas.
	windowMorph extent: 800 @ 800.
	windowMorph changed.
	pane := windowMorph asSpecAdapter.
	pane changed