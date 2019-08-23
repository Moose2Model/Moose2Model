as yet unclassified
setCurrentLayout: aRTView message: aBoolean
	| layout moose2ModelName oldName |
	oldName := self currentLayoutName.
	layout := self layoutForRTView: aRTView message: aBoolean.
	layout isDefined
		ifTrue: [ moose2ModelName := layout moose2ModelName.
			oldName = moose2ModelName
				ifTrue: [ self inform: 'Layout not changed: ' , moose2ModelName ]
				ifFalse: [ self currentLayoutName: moose2ModelName.
					self inform: 'Old layout: ' , oldName , ' New layout: ' , moose2ModelName ] ]
		ifFalse: [ UIManager default alert: 'Current layout is not changed' ]