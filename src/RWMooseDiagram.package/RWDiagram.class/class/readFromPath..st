FileAccess
readFromPath: aPath
	<RWDiaEdit_13>
	<RWDiaEdit_43>
	| e filename path delimiter |
	"Read a file named like the current Layout from a given path"
	e := RWDiagramEditor uniqueInstance.
	delimiter := DiskStore currentFileSystem delimiter.
	aPath last = delimiter
		ifTrue: [ path := aPath ]
		ifFalse: [ path := aPath , delimiter asString ].
	filename := path , self currentLayoutName , '.xml'.
	e readFromFile: filename