as yet unclassified
dName
	RWDiagramAnonymize anonymize
		ifTrue: [ ^ RWDiagramAnonymize getAnonymName: famixElement moose2ModelName withPrefix: 'moose2ModelName' ].
	^ famixElement moose2ModelName