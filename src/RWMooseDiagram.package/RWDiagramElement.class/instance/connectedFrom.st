connections
connectedFrom
	connectedFrom ifNil: [ connectedFrom := Set new ].
	^ connectedFrom