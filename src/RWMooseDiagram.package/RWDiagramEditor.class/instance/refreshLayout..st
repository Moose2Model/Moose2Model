accessing
refreshLayout: aRWDiagramLayout
	"Creates a new instance for the current layout. This is needed if the reported MooseModel changes."

	| layout moose2ModelName |
	moose2ModelName := aRWDiagramLayout moose2ModelName.
	layouts ifNil: [ layouts := Dictionary new ].
	layouts at: moose2ModelName put: ( RWDiagramLayout new moose2ModelName: moose2ModelName ).
	layout := layouts at: moose2ModelName.
	^ layout