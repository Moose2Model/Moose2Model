list
listLayouts
	| stream return |
	stream := WriteStream on: String new.
	return := String crlf.
	stream nextPutAll: 'Current layout: ';
	       nextPutAll: currentLayoutName;
	       nextPutAll: return.
	stream
		nextPutAll: 'A list with all available layouts:';
		nextPutAll: return.
	layouts asSortedCollection
		do: [ :each | 
			stream
				nextPutAll: each moose2ModelName;
				nextPutAll: return ].
	Transcript
		cr;
		show: stream contents