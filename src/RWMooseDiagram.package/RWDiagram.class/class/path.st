commenting
path
	path ifNil: [ path := '' ].
	path = ''
		ifTrue: [ ^ FileSystem disk workingDirectoryPath asFileReference fullName ]
		ifFalse: [ ^ path ]