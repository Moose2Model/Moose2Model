comparing
= anInstance
	self class moose2ModelName asLowercase = anInstance class moose2ModelName asLowercase 
		ifFalse: [ ^ false ].
		"refersToLayer is used for processing, it is not specifying the type. So do not use it for comparison"
	"self refersToLayer = anInstance refersToLayer
		ifFalse: [ ^ false ]."
	^ true