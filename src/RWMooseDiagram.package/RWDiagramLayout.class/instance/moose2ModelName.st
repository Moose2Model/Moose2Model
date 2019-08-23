accessing
moose2ModelName
   moose2ModelName ifNil: [ "Only required when code changes. In that moose2Model will initiall by empty, so fill it with the current name" moose2ModelName := name ].
	RWDiagramAnonymize anonymize
		ifTrue: [ ^ RWDiagramAnonymize getAnonymName: moose2ModelName withPrefix: 'Layout' ].
	^moose2ModelName 