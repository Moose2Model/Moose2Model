as yet unclassified
testIsModelElementsuppressedWithChildren
	| editor layout |
	editor := RWDiagramEditor new.
	layout := editor currentLayout.
	layout moose2ModelName: 'test'.
	self assert: (layout isModelElementsuppressedWithChildren: class1RWDE ) equals: false.
	editor suppressWithChildren: true to: class1RWDE.
	self assert: (layout isModelElementsuppressedWithChildren: class1RWDE ) equals: true