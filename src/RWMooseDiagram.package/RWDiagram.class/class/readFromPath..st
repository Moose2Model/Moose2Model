FileAccess
readFromPath: aPath
	<RWDiaEdit_13>
	<RWDiaEdit_43>
	| e filename  delimiter |
	"28.8.2019, the local variable path was shadowed by the global variable path. It is removed, because otherwise errors occured"
	"Read a file named like the current Layout from a given path"
	e := RWDiagramEditor uniqueInstance.
	delimiter := DiskStore currentFileSystem delimiter.
	aPath last = delimiter
		ifTrue: [ path := aPath ]
		ifFalse: [ path := aPath , delimiter asString ].
	filename := path , self currentLayoutName , '.xml'.
	e readFromFile: filename