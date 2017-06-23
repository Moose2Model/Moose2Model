accessing
name
	RWDiagramAnonymize anonymize
		ifTrue: [ ^ RWDiagramAnonymize getAnonymName: name withPrefix: 'Layout' ].
	^name 