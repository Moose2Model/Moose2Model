as yet unclassified
dName
	RWDiagramAnonymize anonymize
		ifTrue: [ ^ RWDiagramAnonymize getAnonymName: famixElement name withPrefix: 'Name' ].
	^ famixElement name