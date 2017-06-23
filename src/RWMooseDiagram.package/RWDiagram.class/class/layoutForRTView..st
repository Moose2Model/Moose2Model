layout
layoutForRTView: aRTView
	<RWDiaEdit_44>
	| e ln |
	e := RWDiagramEditor uniqueInstance.
	ln := (e layoutForRTView: aRTView) name.
	self inform: ln.
	^ ln