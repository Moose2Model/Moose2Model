commenting
comment: aString to: aRWDiagramElement
<RWDiaEdit_47>
	| string |
	string := aString
		copyReplaceAll: '<br>'
		with: Character cr asString , Character lf asString.
	self
		remember: [ :attributeList | attributeList comment: (RWDiagramLocalComment text: string )]
		ofModel: aRWDiagramElement