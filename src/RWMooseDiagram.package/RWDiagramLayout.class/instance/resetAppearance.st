as yet unclassified
resetAppearance
	elementGroup elementList do: [ :each | each attributeList attributeIsSpecified ifTrue: [ each attributeList appearance: RWDiagramUndeterminedAppearance new ] ]