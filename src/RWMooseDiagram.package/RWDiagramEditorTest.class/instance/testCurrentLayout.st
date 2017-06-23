environment
testCurrentLayout
|editor|
editor := RWDiagramEditor new.
editor currentLayoutName: 'test'.
self assert: editor currentLayout class asString equals: 'RWDiagramLayout'.