file
writeToFile: aFileName
	self currentLayout
		ifNil: [ Warning signal: 'Current view' , currentLayoutName , ' does not exist'.
			nil ]
		ifNotNil: [ FileStream forceNewFileNamed: aFileName do: [ :stream | self currentLayout writeToStream: stream ] ]