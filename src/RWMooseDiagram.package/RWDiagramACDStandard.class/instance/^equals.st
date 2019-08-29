accessing
= anInstance
	self class moose2ModelName asLowercase = anInstance class moose2ModelName asLowercase 
		ifFalse: [ ^ false ].
	self includeMe = anInstance includeMe
		ifFalse: [ ^ false ].
	self usedByLayers = anInstance usedByLayers
		ifFalse: [ ^ false ].
	self usingLayers = anInstance usingLayers
		ifFalse: [ ^ false ].
		"Do not check for identy of elements. The following is used while generating diagrams:"
	"self ofElement = anInstance ofElement
		ifFalse: [ ^ false ]."
	^ true