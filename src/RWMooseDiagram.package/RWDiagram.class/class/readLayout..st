layout
readLayout: aString
	| e |
	"Only used from playground"
	path
		ifNil: [ self inform: 'Specify a global path using RWDiagram setPath: myPath' ]
		ifNotNil: [ e := RWDiagramEditor uniqueInstance.
			"Specify the Layout to be processed"
			e currentLayoutName: aString.
			e currentLayout refresh.
			self readFromPath: path expliciteStream: nil.
			self inform: 'Layout: ' , aString , ' was read from path ' , path ]