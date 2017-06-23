as yet unclassified
highlight
	changeTypes
		do: [ :each | 
			each highlight
				ifTrue: [ ^ true ] ].
	^ false