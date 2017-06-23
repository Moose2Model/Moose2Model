as yet unclassified
anonymize: aBoolean
	aBoolean
		ifTrue: [ anonymize := true.
			        number := 1.
			^ self ]
		ifFalse: [ anonymize := false.
			^ self ].
	UIManager default alert: 'Only true or false are allowed'