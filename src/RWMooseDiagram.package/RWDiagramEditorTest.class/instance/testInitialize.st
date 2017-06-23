initialization
testInitialize
	| editor |
	editor := RWDiagramEditor new.
	editor initialize.
	self assert: editor currentLayoutName equals: 'First'.
	self assert: editor settings isReading equals: true