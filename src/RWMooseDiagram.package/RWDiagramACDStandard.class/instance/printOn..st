print
printOn: aStream
	super printOn: aStream.
	self includeMe
		ifTrue: [ aStream nextPutAll: ' includes this' ].
	self usedByLayers = 0
		ifFalse: [ aStream nextPutAll: ' usedByLayers: ' , self usedByLayers asString ].
	self usingLayers = 0
		ifFalse: [ aStream nextPutAll: ' usingLayers: ' , self usingLayers asString ]