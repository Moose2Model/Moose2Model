tests
testClassBoxSuppressed
	| l |
	l := RWDiagramLayout new.
	self assert: l classBoxSuppressed equals: false.
	l classBoxSuppressed: true.
	self assert: l classBoxSuppressed equals: true.
	l classBoxSuppressed: false.
	self assert: l classBoxSuppressed equals: false