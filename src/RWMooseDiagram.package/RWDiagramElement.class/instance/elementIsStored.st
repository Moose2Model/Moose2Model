as yet unclassified
elementIsStored
	^ (self famixElement class asString = self aByteString | (self famixElement class asString = self aUndefinedObject)) not