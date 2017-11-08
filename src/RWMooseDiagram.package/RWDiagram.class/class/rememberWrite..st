FileAccess
rememberWrite: aRTView
  " Write to the global path"
	RWDiagram rememberRTView: aRTView.
	RWDiagram write: aRTView toPath: RWDiagram path