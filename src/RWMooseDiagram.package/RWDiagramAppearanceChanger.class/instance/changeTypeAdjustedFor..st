as yet unclassified
changeTypeAdjustedFor: aRWDiagramElement
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
  changeType := changeType copy.
  changeType adjustBy: aRWDiagramElement forChangeDeterminer: changeDeterminer.
	^ changeType