*Moose2Model
moose2ModelReadLayoutExpliciteFile: aFilename
	| layout layouts index frontend |
	"Supports automatic tests"
	layouts := RWDiagramLayoutManager new layoutsOfCurrentPath.
	aFilename ifNil: [ index := UIManager default chooseFrom: layouts ] ifNotNil: [ index := layouts indexOf: aFilename ].
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout ofMooseModel: self expliciteStream: nil.
			self inform: 'Read layout:' , layout.
			frontend := self moose2ModelDependency.
			^ frontend	"Required for automatic tests" ]
		ifFalse: [ ^ nil	"This is not beautiful, but it makes the actual logic more explicite so return nil" ]