accessing
= anInstance
	self class name = anInstance class name
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