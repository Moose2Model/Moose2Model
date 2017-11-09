writeFile
writeToStream: aStream
	| writer layoutFile |
	layoutFile := RWDiagramLayoutFile new.
	(writer := XMLWriter on: aStream)
		enablePrettyPrinting;
		xml;
		lineBreak: String crlf;
		comment: 'Moose2Model Layout data, see www.moose2model.org on how to use this file'.
	writer tag
		name: #elements;
		with: [ writer tag: #version with: self actualVersion.
			self scope = self packageScope
				ifTrue: [ writer tag: #scope with: #package ]
				ifFalse: [ self scope = self classScope
						ifTrue: [ writer tag: #scope with: #class ]
						ifFalse: [ self scope = self methodScope
								ifTrue: [ writer tag: #scope with: #method ] ] ].
			elementGroup elementList
				do: [ :element | 
					element elementIsStored
						ifTrue: [ element attributeList attributeIsSpecified
								ifTrue: [ writer tag
										name: #element;
										with: [ layoutFile writeElement: element toXML: writer.
											layoutFile writeAttributeList: element attributeList toWriter: writer ] ] ] ] ]