file
setLayOutFromFilename: aFilename
	| fn |
	fn := (FileSystem disk pathFromString: aFilename) basenameWithoutExtension.
	fn = self currentLayoutName
		ifFalse: [ (self confirm: 'Change layout to filename' , fn , '?')
				ifTrue: [ self currentLayoutName: fn ] ]