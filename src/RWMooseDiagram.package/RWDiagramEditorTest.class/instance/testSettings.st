initialization
testSettings
	| editor |
	editor := RWDiagramEditor new.
	self assert: editor settings class asString equals: 'RWDiagramSettings'