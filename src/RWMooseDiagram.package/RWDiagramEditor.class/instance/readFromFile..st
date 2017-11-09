file
readFromFile: aFileName
	FileStream
		readOnlyFileNamed: aFileName
		do: [ :stream | self currentLayout readFromStream: stream message: true ].
	RWDiagramSimpleGui getInstance redrawMe