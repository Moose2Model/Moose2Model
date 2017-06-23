as yet unclassified
position
  "Returns an instance of RWDiagramPosition"
  "If no position is determined, returns RWDiagramUndeterminedPosition"
	elementPosition ifNil: [ elementPosition := RWDiagramUndeterminedPosition new ].
	^ elementPosition