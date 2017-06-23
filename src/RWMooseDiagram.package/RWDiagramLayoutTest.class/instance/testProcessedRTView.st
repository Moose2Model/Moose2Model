as yet unclassified
testProcessedRTView
	| aRTView l |
	aRTView := RTView new.
	l := RWDiagramLayout new.
	l processedRTView: aRTView.
	self assert: l processedRTView equals: aRTView