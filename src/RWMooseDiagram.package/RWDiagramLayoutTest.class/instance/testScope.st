tests
testScope
	| layout |
	layout := RWDiagramLayout new.
	self assert: layout scope equals: layout methodScope.
	layout scope: layout packageScope.
	self assert: layout scope equals: layout packageScope.
	layout scope: layout classScope.
	self assert: layout scope equals: layout classScope