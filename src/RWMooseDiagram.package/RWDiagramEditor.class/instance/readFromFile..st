file
readFromFile: aFileName
	"Will be replaced with 
readFromFile: aFileName expliciteStream: aStream"

	FileStream readOnlyFileNamed: aFileName do: [ :stream | self currentLayout readFromStream: stream message: true ].
	RWDiagramSimpleGui getInstance redrawMe