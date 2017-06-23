readFile
readFromStream: aReadStream message: aBoolean
	self replaceMooseEntities: false.
	[ self readFromStreamXML: aReadStream ]
		on: XMLWellFormednessException
		do: [ aBoolean
				ifTrue: [ UIManager default
						alert:
							'XML not well formed. It may be corrupt. I may be in old format. See on project page on what to do in that case.' ] ].
	self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined