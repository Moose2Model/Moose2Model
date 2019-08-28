FileAccess
readFromPath: aPath expliciteStream: aStream
	<RWDiaEdit_13>
	<RWDiaEdit_43>
	| e filename localPath delimiter |
	"28.8.2019, the local variable path shadowed the global variable path. It is renamed, because otherwise codechanges where not possible"
	"Read a file named like the current Layout from a given path"
	e := RWDiagramEditor uniqueInstance.
	delimiter := DiskStore currentFileSystem delimiter.
	aPath last = delimiter
		ifTrue: [ localPath := aPath ]
		ifFalse: [ localPath := aPath , delimiter asString ].
	filename := localPath , self currentLayoutName , '.xml'.
	e readFromFile: filename expliciteStream: aStream