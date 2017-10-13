displayformatters
displayFormatter
	"Shall the diagram be generated with informations on the formatting settings. Especially about the active appearance changers."

	displayFormatter ifNil: [ displayFormatter := false ].
	^ displayFormatter