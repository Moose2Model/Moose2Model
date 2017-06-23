globalFile
writeGlobalToStream: aReadWriteStream
	| writer globalFile |
   self haltOnce.
	globalFile := RWDiagramGlobalFile new.
	(writer := XMLWriter on: aReadWriteStream)
		enablePrettyPrinting;
		xml;
		lineBreak: String crlf;
		comment: 'Global Comments'.
	writer tag
		name: #elements;
		with: [ globalElementGroup elementList
				do: [ :element | 
					writer tag
						name: #element;
						with: [ globalFile writeElement: element toXML: writer.
							globalFile writeGlobalAttributeList: element attributeList toWriter: writer ] ] ]