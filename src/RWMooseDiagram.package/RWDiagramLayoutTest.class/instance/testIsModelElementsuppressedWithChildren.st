as yet unclassified
testIsModelElementsuppressedWithChildren
	| editor layout |
	editor := RWDiagramEditor new.
	layout := editor currentLayout.
	layout name: 'test'.
	self assert: (layout isModelElementsuppressedWithChildren: class1RWDE ) equals: false.
	editor suppressWithChildren: true to: class1RWDE.
	self assert: (layout isModelElementsuppressedWithChildren: class1RWDE ) equals: true