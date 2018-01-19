tests
testPackageBoxSuppressed
	| l |
	l := RWDiagramLayout new.
	self assert: l packageBoxSuppressed equals: false.
	l packageBoxSuppressed: true.
	self assert: l packageBoxSuppressed equals: true.
	l packageBoxSuppressed: false.
	self assert: l packageBoxSuppressed equals: false