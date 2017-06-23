public
testCurrentLayoutName
|editor|
editor := RWDiagramEditor new.
editor currentLayoutName: 'test'.
self assert: editor currentLayoutName equals: 'test'.