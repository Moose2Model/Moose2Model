accessing
setlistWithHash
	famixElementHash ifNil: [ famixElementHash := Dictionary new ].	"Set list with hash"
	lastHash ifNil: [ lastHash := 0 ].
	[ famixElementHash at: uniqueKey ]
		on: KeyNotFound
		do: [ lastHash := lastHash + 1.
			famixElementHash at: uniqueKey put: lastHash ]