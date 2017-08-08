accessing
setListWithUniqueKey
	famixElementByUniqueKey
		ifNil: [ famixElementByUniqueKey := Dictionary new ].
	[ famixElementByUniqueKey at: uniqueKey ]
		on: KeyNotFound
		do: [ famixElementByUniqueKey at: uniqueKey put: self ]