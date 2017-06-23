as yet unclassified
anonymize
	anonymize ifNil: [ anonymize := false ].
	anonymize
		ifTrue: [ ^ true ].
	^ false