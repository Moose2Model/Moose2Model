appearancePermanent
suppressWithChildren: aBoolean to: aModelElement
<RWDiaEdit_18>
"To exclude a package, class, ... together with all sub elements from a diagram (stored to file)"
	| e |
	e := RWDiagramEditor uniqueInstance.
self suppressWithChildren: aBoolean to: aModelElement ofLayout: e currentLayout