accessing
getElementForFAMIXElement: fe
	^ self apply: [ :e | e ] toAttribute: fe replace: false