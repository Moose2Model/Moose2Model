as yet unclassified
othersAreSuppressed
	changeTypes
		do: [ :each | 
			each suppressOthers
				ifTrue: [ ^ true ] ].
	^ false