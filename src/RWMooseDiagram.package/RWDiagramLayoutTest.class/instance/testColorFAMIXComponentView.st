as yet unclassified
testColorFAMIXComponentView
	| l aRTView aRTElement aFAMIXClass aFAMIXMethod |
	l := RWDiagramLayout new.
	aRTView := RTView new.
	aRTElement := RTElement new.
	aRTElement color: Color green.
	aFAMIXClass := FAMIXClass new.
	aFAMIXClass name: 'Class1'.
	aFAMIXMethod := FAMIXMethod new.
	aFAMIXMethod name: 'Method1'.
	aFAMIXMethod parentType: aFAMIXClass.
	aRTElement model: (RWDiagramElement famixElement: aFAMIXMethod).
	aRTView add: aRTElement.
	l color: Color blue FAMIXComponent: aFAMIXMethod  view: aRTView.
	self assert: aRTElement color equals: Color blue