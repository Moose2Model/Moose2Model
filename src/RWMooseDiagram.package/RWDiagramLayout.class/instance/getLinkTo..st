sourceAnchor
getLinkTo: aRWDiagramElement
	| string |
	(self hasFileInfos: aRWDiagramElement)
		ifTrue: [ string := aRWDiagramElement famixElement sourceAnchor fileName.
			Clipboard new clipboardText: string.
			self inform: string , ' copied to Clipboard' ]
		ifFalse: [ self inform: 'No Source information attached' ]