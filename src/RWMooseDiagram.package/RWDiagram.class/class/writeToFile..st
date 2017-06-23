FileAccess
writeToFile: aFilename
	"Write data of current Layout to file"

	<RWDiaEdit_12>
	<RWDiaEdit_46>
	| e fn |
	e := RWDiagramEditor uniqueInstance.
	fn := (FileSystem disk pathFromString: aFilename) basenameWithoutExtension.
	e currentLayoutName = fn
	   ifTrue: [ e write: e currentLayout toFile: aFilename ]
		ifFalse: [ (self
				confirm: 'Filename ' , fn , ' is different from current Layout ' , e currentLayoutName , 'Do you still want to save?')
				ifTrue: [ e write: e currentLayout toFile: aFilename ]
				ifFalse: [ self inform: 'Nothing is saved' ] ]