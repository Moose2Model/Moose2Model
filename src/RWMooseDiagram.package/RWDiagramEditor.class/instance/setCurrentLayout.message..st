as yet unclassified
setCurrentLayout: aRTView message: aBoolean
	| layout name oldName |
	oldName := self currentLayoutName.
	layout := self layoutForRTView: aRTView message: aBoolean.
	layout isDefined
		ifTrue: [ name := layout name.
			oldName = name
				ifTrue: [ self inform: 'Layout not changed: ' , name ]
				ifFalse: [ self currentLayoutName: name.
					self inform: 'Old layout: ' , oldName , ' New layout: ' , name ] ]
		ifFalse: [ UIManager default alert: 'Current layout is not changed' ]