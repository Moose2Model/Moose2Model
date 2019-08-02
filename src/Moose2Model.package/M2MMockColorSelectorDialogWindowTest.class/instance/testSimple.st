tests
testSimple
	| i |
	i := M2MMockColorSelectorDialogWindow new.
	self assert: (i title: 'My title') isNotNil.
	self assert: i title equals: 'My title'