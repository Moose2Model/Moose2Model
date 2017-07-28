commenting
openLinkTo: aRWDiagramElement
	| string |
	aRWDiagramElement famixElement sourceAnchor
		ifNotNil: [ string := aRWDiagramElement famixElement sourceAnchor fileName.
			OSProcess command: 'cmd /C start ' , string.
			self inform: 'URL ' , string , ' is opened. In case of SAP ADT links have to be activated.' ]
		ifNil: [ self inform: 'No Source information attached' ]