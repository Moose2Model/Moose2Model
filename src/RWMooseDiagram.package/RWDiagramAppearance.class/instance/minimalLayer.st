as yet unclassified
minimalLayer
	| tempLayer |
	tempLayer := nil.
	changeTypes
		do: [ :each | 
			each suppressOthers
				ifTrue: [ tempLayer ifNil: [ tempLayer := each refersToLayer ] ifNotNil: [  ] ] ].
	^ tempLayer