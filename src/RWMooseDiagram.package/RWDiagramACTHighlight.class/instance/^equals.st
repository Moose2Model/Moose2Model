comparing
= anInstance
	self class name = anInstance class name
		ifFalse: [ ^ false ].
	^ true
	