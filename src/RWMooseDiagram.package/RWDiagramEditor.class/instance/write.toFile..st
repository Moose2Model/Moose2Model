file
write: aLayout toFile: aFileName
	FileStream forceNewFileNamed: aFileName do: [ :stream | aLayout writeToStream: stream ]