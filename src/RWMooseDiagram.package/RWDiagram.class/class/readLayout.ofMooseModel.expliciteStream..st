as yet unclassified
readLayout: aString ofMooseModel: aMooseModel expliciteStream: aStream
	| e |
	"Supports automatic tests"
	e := RWDiagramEditor uniqueInstance.
	"Specify the Layout to be processed"
	e currentLayoutName: aString.
	e currentLayout refresh.
	e currentLayout mooseID = aMooseModel mooseID
		ifFalse: [ e refreshLayout: e currentLayout.
			e currentLayout mooseID: aMooseModel mooseID ].
	self readFromPath: RWDiagram path expliciteStream: aStream.
	self inform: 'Layout: ' , aString , ' was read from path ' , RWDiagram path