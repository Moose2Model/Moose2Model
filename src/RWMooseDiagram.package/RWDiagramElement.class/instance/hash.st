comparing
hash
	[ ^ famixElementHash at: uniqueKey ]
		on: KeyNotFound
		do: [ self setlistWithHash.
			^ famixElementHash at: uniqueKey ]