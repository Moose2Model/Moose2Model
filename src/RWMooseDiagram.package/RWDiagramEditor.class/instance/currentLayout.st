accessing
currentLayout
	"Creates a new view if not yet existing"

	| layout |
	layouts ifNil: [ layouts := Dictionary new ].
	layout := layouts at: currentLayoutName ifAbsentPut: [ RWDiagramLayout new moose2ModelName: currentLayoutName ].
	currentLayout := layout.
	^ layout