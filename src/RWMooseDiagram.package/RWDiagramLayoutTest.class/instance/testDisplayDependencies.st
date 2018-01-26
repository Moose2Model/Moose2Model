tests
testDisplayDependencies
	| l |
	l := RWDiagramLayout new.
	self assert: l displayDependencies equals: false.
	l displayDependencies: true.
	self assert: l displayDependencies equals: true.
	l displayDependencies: false.
	self assert: l displayDependencies equals: false