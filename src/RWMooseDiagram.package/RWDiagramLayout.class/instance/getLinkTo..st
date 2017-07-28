sourceAnchor
getLinkTo: aRWDiagramElement
	| string |
	aRWDiagramElement famixElement sourceAnchor
		ifNotNil: [ string := aRWDiagramElement famixElement sourceAnchor fileName.
			Clipboard new clipboardText: string.
			self inform: string , ' copied to Clipboard' ]
		ifNil: [ self inform: 'No Source information attached' ]