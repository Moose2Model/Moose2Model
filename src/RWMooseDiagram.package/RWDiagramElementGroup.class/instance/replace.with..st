as yet unclassified
replace: foundElement with: aMooseEntity
	elementList removeKey: foundElement uniqueKey ifAbsent: [  ].
	foundElement famixElement: aMooseEntity.
	elementList at: foundElement uniqueKey put: foundElement