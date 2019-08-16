accessing
rtView: aRTView mooseModel: aMooseModel
|windowMorph|
   myTitle := ( RWDiagramEditor uniqueInstance currentLayoutName ) , ' - ' , aMooseModel name.
	rtView := aRTView.
	
	windowMorph := TRMorph new.
	windowMorph canvas: rtView view canvas.
	windowMorph hResizing: #spaceFill.
	windowMorph vResizing: #spaceFill.
	windowMorph changed.
	pane := windowMorph asSpecAdapter.
	pane changed