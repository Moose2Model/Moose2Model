accessing
rtView: aRTView
|windowMorph|
   myTitle := RWDiagramEditor uniqueInstance currentLayoutName.
	rtView := aRTView.
	
	windowMorph := TRMorph new.
	windowMorph canvas: rtView view canvas.
	windowMorph hResizing: #spaceFill.
	windowMorph vResizing: #spaceFill.
	windowMorph changed.
	pane := windowMorph asSpecAdapter.
	pane changed