accessing
colorChooser
  "I return a mock instanace during tests.
In all other cases I return always a new instance"
	colorChooser
		ifNil: [ ^ ColorSelectorDialogWindow new ]
		ifNotNil: [ ^ colorChooser ]