appearancePermanent
suppressWithChildren: aBoolean to: aModelElement
<RWDiaEdit_18>
"To exclude a package, class, ... together with all sub elements from a diagram (stored to file)"
	| e aRWDiagramElement |
	e := RWDiagramEditor uniqueInstance.
    (aModelElement class inheritsFrom: MooseEntity) ifTrue:[aRWDiagramElement := aModelElement asRWDiagramElement: e]ifFalse:[aRWDiagramElement := aModelElement].	
	e suppressWithChildren: aBoolean to: aRWDiagramElement