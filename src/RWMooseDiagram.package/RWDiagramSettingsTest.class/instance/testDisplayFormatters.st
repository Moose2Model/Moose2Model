tests
testDisplayFormatters
	| settings |
	settings := RWDiagramSettings new.
	self assert: settings displayFormatter equals: false.
	settings displayFormatter: true.
	self assert: settings displayFormatter equals: true