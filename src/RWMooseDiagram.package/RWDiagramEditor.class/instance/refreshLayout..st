accessing
refreshLayout: aRWDiagramLayout
	"Creates a new instance for the current layout. This is needed if the reported MooseModel changes."

	| layout name |
	name := aRWDiagramLayout name.
	layouts ifNil: [ layouts := Dictionary new ].
	layouts at: name put: ( RWDiagramLayout new name: name ).
	layout := layouts at: name.
	^ layout