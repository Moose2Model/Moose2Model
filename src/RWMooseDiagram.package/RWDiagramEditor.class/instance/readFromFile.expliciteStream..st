file
readFromFile: aFileName expliciteStream: aStream
	"When aStream is provided (not nil) use the stream instead. 
This is required for tests"

	aStream
		ifNil: [ FileStream readOnlyFileNamed: aFileName do: [ :stream | self currentLayout readFromStream: stream message: true ] ]
		ifNotNil: [ self currentLayout readFromStream: aStream message: true ].
	RWDiagramSimpleGui getInstance redrawMe