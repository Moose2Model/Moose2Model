as yet unclassified
printOn: aStream
	super printOn: aStream.
	famixElement
		ifNotNil: [ aStream nextPutAll: ' '.
			famixElement printOn: aStream ]