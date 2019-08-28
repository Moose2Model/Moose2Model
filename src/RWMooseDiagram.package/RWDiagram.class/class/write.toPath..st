FileAccess
write: aRTView toPath: aPath
	<RWDiaEdit_41>
	<RWDiaEdit_42>
	| e filename delimiter info oldName l |
	"Store to a file named like layout that belongs to the RTView in a path"
	delimiter := DiskStore currentFileSystem delimiter.
	aPath last = delimiter
		ifTrue: [ path := aPath ]
		ifFalse: [ path := aPath, delimiter asString ].
	e := RWDiagramEditor uniqueInstance.
	l := e layoutForRTView: aRTView message: true.
	l isDefined
		ifTrue: [ filename := path , l moose2ModelName , '.xml'.
			e writeToFile: filename.
			info := 'layout ' , l moose2ModelName , ' saved to ' , filename.
			oldName := e currentLayout moose2ModelName.
			oldName = l moose2ModelName
				ifFalse: [ e currentLayoutName: l moose2ModelName.
					info := info , ' old Layout: ' , oldName , ' changed to: ' , l moose2ModelName ].
			self inform: info ]
		ifFalse: [ UIManager default alert: 'No Layout assigned to this view. Perform save for the processed View of a Layout. You may use the most recently written diagram for this.' ]