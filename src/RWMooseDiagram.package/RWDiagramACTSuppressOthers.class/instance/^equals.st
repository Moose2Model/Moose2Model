comparing
= anInstance
	self class name = anInstance class name
		ifFalse: [ ^ false ].
		"refersToLayer is used for processing, it is not specifying the type. So do not use it for comparison"
	"self refersToLayer = anInstance refersToLayer
		ifFalse: [ ^ false ]."
	^ true