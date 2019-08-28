file
write: aLayout toFile: aFileName
"Is obsolete?"
	FileStream forceNewFileNamed: aFileName do: [ :stream | aLayout writeToStream: stream ]